module ApplicationHelper

def login_links
  output = ""
  if current_user?
     output << "Logged in as: #{link_to(current_user.login,account_url)} | "
     if current_user.admin?
	output << "#{link_to("Administration", :controller=>"admin", :action=>"dashboard")} | "
     end
     output << link_to("Logout", "/logout")
  else
    setting = Setting.find_by_name("allow_user_register_user")
    if setting.setting_data 
       output << "#{link_to('Register', new_user_path)} | "
    end
    output << link_to("Login","/login")
  end
  return output
end

def flash_notice
 output = ""
 if flash[:notice]
   output << "<div id='notice'>#{flash[:notice]}</div>"
 end
 return output
end

def show_menu(type,name)
  output = ""
   unless Menuset.find_by_name(name).nil?
     output << render(:partial=>"layouts/#{type}", :locals=>{:menusetname=>name})
   end
end

def get_all_menus(record)
    menu = Array.new
    Menuset.all.each do |menuset|
    top_items = Menu.find_all_by_menuset_id_and_level(menuset.id,1,:order => 'position')
    menu << menuset
    top_items.each { |item| add_item_to_menu(record, item, menu)}
    end
    return menu
  end

  def add_item_to_menu(record, item, menu)
      unless record.nil?
	      unless record.id == item.id
		menu << item #"#{leader}#{item.name}"
		item.children.each { |child| add_item_to_menu(record, child, menu) }
	      end
      else
	      menu << item #"#{leader}#{item.name}"
		item.children.each { |child| add_item_to_menu(record, child, menu) }
      end
  end

  def login_strip
	return (!current_user) ? link_to("Admin Login", :controller=>"user_sessions", :action=>"new") : loggedin_strip
  end

  def loggedin_strip
    output = ""
    if current_user
     if current_user.admin == true
       output << link_to("Administration", :controller=>"admin", :action=>"dashboard")
	 output << " | "
     end
     output << link_to("Logout", user_session_path, :method => :delete)
    end
    return output
  end

  def get_page_variable(name)
     pcv = PageVariableSetting.find_by_name(name)
     returnvalue = ""
     unless pcv.nil?
	returnvalue = pcv.default_value
      page = nil
      page = Page.find_by_perma_link(request.env["REQUEST_URI"].gsub("http://#{request.env['HTTP_HOST']}",'')) if !request.nil? && !request.env["REQUEST_URI"].nil?
      unless page.nil?
       pv = PageVariable.find_by_page_id_and_page_variable_setting_id(page.id,pcv.id)
	 unless pv.nil?
        returnvalue = pv.variable_value
       end 
	end
     end
     return returnvalue
  end

  def get_setting(settingname)
    setting = Setting.find_by_name(settingname)
    return (setting.nil? ? nil : setting.setting_data)
  end

  def get_pagelet(handle) 
  
   render :partial=>"shared/pagelet",:locals=>{:handle=>handle}
  end

  def get_form_data(type,value)
    case type

    when "Checkbox"
      return value.blank? ? "" : (value == "1" ? "Yes" : "No")
    when "File"
      unless value.blank?
       asset = Asset.find(value)
       return check_content_type(asset)
      end
    else
      return value

    end
  end

 def get_submission_model_data(submission,component_name)
  mc = ModelComponent.find_by_object_model_id_and_component_name(submission.object_model.id,component_name)
  if mc.nil?
    unless ["created_at","updated_at"].include?(component_name)
      return ""
    else
      return submission.send(component_name)
    end
  else
    md= ModelData.find_by_model_submission_id_and_model_component_id(submission.id,mc.id)
    if md.nil?
      return ""
    else
      return get_form_data(mc.component_type,md.data_value)
    end
  end
 end

   def check_content_type(asset)

      if asset.upload_content_type.match(/^image/)
       output = link_to(image_tag(asset.upload.url(:thumb)),asset.upload.url)
       unless asset.sizes.nil?
         sizes = asset.sizes.split(",")
         sizes.each do |size|
           output << "  "
           output << link_to(image_tag(asset.upload.url(size)),asset.upload.url)
         end 
       end  
       return output
      else
        return link_to("#{asset.upload_file_name}", asset.upload.url)
      end
  end

  def validate_permission(call_type,model, submission=nil)
    
   role_id = current_user.nil? ? 1 : current_user.role_id
   if ["edit","delete","deletecomment"].include?(call_type)
     unless current_user?
       call_type = "#{call_type}other"
     else
       unless submission.nil?
        unless submission.creator_id == current_user.id
         call_type = "#{call_type}other"
        end
       end
     end
   end
   permission = Permission.find(:first,:conditions=>["permission_type=? and permission_object=? and activity_code=?",model.class.to_s,model.name,call_type])
   permissionrole = PermissionRole.find(:first,:conditions=>["permission_id=? and role_id=?",permission.id,role_id])
   return permissionrole.nil? ? false : permissionrole.value
  end
  
  def process_page(pagebody)
    #evaluate the page for following options
    #&lt; Upcase
    pagebody = evaluate_page(pagebody,"&lt;","&gt;",true)
    #&lt; Downcase
    pagebody = evaluate_page(pagebody,"&lt;","&gt;",false)
    # < Upcase
    pagebody = evaluate_page(pagebody,"<",">",true)
    # < Downcase
    pagebody = evaluate_page(pagebody,"<",">",false)
    pagebody
  end

  def evaluate_page(pagebody,open_tag,close_tag,upcase)
    #Split Code with &lt;
    separator = "#{open_tag}RLING::"
    separator = separator.downcase unless upcase
    codes = pagebody.split(separator)
  
    hash = Hash.new
    if codes.size > 1
       codes.each_with_index do |code,i|
         next if i==0
         tag = code.split(close_tag)[0]
         splits = tag.split("::")
         hash[tag] = splits[1]
       end
    end
    hash.each do |k,v|
     newpage = Page.find_by_perma_link("/"+v.downcase)
     unless newpage.nil?
       page_content = render(:partial=>"page_data",:locals=>{:page=>newpage})
       pagetype = newpage.type.nil? ? "PAGE" : (newpage.type == "ObjectForm" ? "OBJECTFORM" : "VIEW")
       code = "#{open_tag}RLING::#{pagetype}::#{v}#{close_tag}"
       code = code.downcase unless upcase
       code2 = "#{open_tag}/RLING::#{pagetype}::#{v}#{close_tag}"
       pagebody = pagebody.gsub(code,page_content)
       pagebody = pagebody.gsub(code2,"")
     end
    end
    return pagebody
  end

end 

module ApplicationHelper

#Login Links - Display this when you want to display both login and logout strips on the layouts
def login_links
  return current_user? ? loggedin_strip : login_strip
end

#Use this only if you want to display login strip
def login_strip
    output = ""
    unless current_user?
     setting = Setting.find_by_name("allow_user_register_user")
     user= User.find(:first)
      unless user.nil?
       output << "#{link_to('Register', new_user_path)} | " if setting.setting_data
       output << link_to("Login","/login")
      end
    end
    return output
end

#Use this only if you want to display logout strip
  def loggedin_strip
     output = ""
     if current_user?
      output << "Logged in as: #{link_to(current_user.login,account_url)} | "
      output << "#{link_to("Administration", "/admin")} | "     if current_user.admin?
      output << link_to("Logout", "/logout")
     end
     return output
  end

  #display search bar
  def search_bar(type="all",query="")
    return render(:partial=>"shared/search_form",:locals=>{:type => type,:query=>query})
  end

#Display Flash Notice when ever necessary
def flash_notice
 return "<div id='notice'>#{flash[:notice]}</div>"  if flash[:notice]
end


#Use this code snippet to display menu type, This code just calls the other codes, actual code to render shall be
#in the name of the file as available in the layouts folder.
def show_menu(type,name)
  output = ""
   unless Menuset.find_by_name(name).nil?
     output << render(:partial=>"layouts/#{type}", :locals=>{:menusetname=>name})
   end
end

#Shows Secondary menus of a page
def show_secondary_menu
   output = ""
  unless params[:permalink].nil?
   page=Page.find_by_perma_link(params[:permalink])
   menu=Menu.find_by_page_id(page.id) unless page.nil?
   unless menu.nil?
     submenus = Menu.find_all_by_parent_id(menu.id,:order=>"position")
      unless submenus.empty?
      output << "<p class='menuset'>"
      submenus.each do |menu|
        menulink = ""
        if (menu.link_path.nil? or menu.link_path.empty?)  and !menu.page_id.nil?
          menulink = menu.page.perma_link
        else
          menulink = menu.link_path
      end
      output << "<a href='/#{menulink}'> #{menu.name}</a> <br> "
    end
    output << "</p>"
     else
          parent_menu=Menu.find_by_id(menu.parent_id)
         unless parent_menu.nil?
           submenus = Menu.find_all_by_parent_id(parent_menu.id,:order=>"position")
      unless submenus.empty?
      output << "<p class='menuset'>"
      submenus.each do |menu|
        menulink = ""
        if (menu.link_path.nil? or menu.link_path.empty?)  and !menu.page_id.nil?
          menulink = menu.page.perma_link
        else
          menulink = menu.link_path
        end
      output << "<a href='/#{menulink}'> #{menu.name}</a> <br> "

     end
     output << "</p>"
     end
    end
   end
  end
end
     return output
end


#shows title
def show_title
unless params[:permalink].nil?
   page=Page.find_by_perma_link(params[:permalink])
  unless page.nil?
    menu=Menu.find_by_page_id(page.id)
    unless menu.nil?
     parent_menu=Menu.find_by_id(menu.parent_id)
     unless parent_menu.nil?
       return  parent_menu.name
     else
       return menu.name
      end
     end
   end
  end
 end


#Get the Menu Tree
def get_all_menus(record)
    group = Array.new
    Menuset.all.each do |menuset|
      group << menuset
       Menu.find_all_by_menuset_id_and_level(menuset.id,1,:order => 'position').each { |item| add_item_to_group(record, item, group)}
    end
    return group
  end

#Get the Category Tree
  def get_all_categories(record)
    group = Array.new
    Categoryset.all.each do |categoryset|
      group << categoryset
      Category.find_all_by_categoryset_id_and_level(categoryset.id,1,:order => 'position').each { |item| add_item_to_group(record, item, group)}
    end
    return group
  end

#Get the CategorySet Tree
  def get_all_categories_for_category_set(categoryset)
    record = nil
    group = Array.new
    group << categoryset
    Category.find_all_by_categoryset_id_and_level(categoryset.id,1,:order => 'position').each { |item| add_item_to_group(record, item, group)}
    return group
  end

#Get all Comments for Model
def get_all_comments(record,model_submission)
    group = Array.new
    CommentSubmission.find_all_by_model_submission_id_and_level(model_submission.id,1).each { |item| add_item_to_group(record, item, group)}
    return group
end

#Add Children to the (Menu/Category) Tree
  def add_item_to_group(record, item, group)
      if record.nil? || record.id != item.id
        group << item
        item.children.each { |child| add_item_to_group(record, child, group) }
      end
  end

#Get the Page Variable information. Identify the page, if Page is found then check the page variable for that page, if page variable found output page variable. If not found check if default value is available in page variable setting, if yes, output default page variable, else output nothing
  def get_page_variable(name)
     pcv = PageVariableSetting.find_by_name(name)
     returnvalue = ""
     unless pcv.nil?
      returnvalue = pcv.default_value
      page = nil
      page = Page.find_by_perma_link(request.env["REQUEST_URI"].gsub("http://#{request.env['HTTP_HOST']}/",'')) if !request.nil? && !request.env["REQUEST_URI"].nil?
      unless page.nil?
       pv = PageVariable.find_by_page_id_and_page_variable_setting_id(page.id,pcv.id)
        returnvalue = pv.variable_value unless pv.nil?
      end
     end
     return returnvalue
  end

#Get the setting value based on the name provided, This is used to evaluate setting information in the site.
  def get_setting(settingname)
    setting = Setting.find_by_name(settingname)
    return (setting.nil? ? nil : setting.setting_data)
  end

#Get the Pagelet for the given handle and output the value as partial.Cache the pagelet if not cached.
  def get_pagelet(handle)
   render :partial=>"shared/pagelet",:locals=>{:handle=>handle}
  end

#get the form information based on output required.
  def get_form_data(type,value)
    case type
    when "Checkbox"
      return value.blank? ? "" : (value == "1" ? "Yes" : "No")
    when "File"
      unless value.blank?
       asset = Asset.find(value)
       return check_content_type(asset)
      end
    when "Textfield","Textarea"
      return auto_link(value)
    else
      return value
    end
  end

#Get model submission data for a given submission and component name
 def get_submission_model_data(submission,component_name)
  mc = ModelComponent.find_by_object_model_id_and_component_name(submission.object_model.id,component_name)
  if mc.nil?
    return ["created_at","updated_at"].include?(component_name) ? submission.send(component_name) : ""
  else
    md= ModelData.find_by_model_submission_id_and_model_component_id(submission.id,mc.id)
    return md.nil? ? "" : get_form_data(mc.component_type,md.data_value)
  end
 end

#Check the content type if the uploaded asset/file is an image or other file. If image, then output all the images based on the size, else
#output simple link for the file name
   def check_content_type(asset)
      if asset.upload_content_type.match(/^image/)
       output = link_to(image_tag(asset.upload.url(:thumb)),asset.upload.url,:target=>'_blank')
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

#This method Validates the Permission of the user to access particular model submission.
 def validate_permission(call_type,model, submission=nil)
   role_id = current_user.nil? ? 1 : current_user.role_id
   if ["edit","delete","deletecomment"].include?(call_type)
     unless current_user?
       call_type = "#{call_type}other"
     else
       if !submission.nil? && submission.creator_id != current_user.id
         call_type = "#{call_type}other"
       end
     end
   end
   if ["deletemycomments"].include?(call_type)
     if !@model_submission.nil? && @model_submission.creator_id == current_user.id
       call_type=call_type
     else
       call_type='nopermission'
     end if !current_user.nil?
   end
   permission = Permission.find(:first,:conditions=>["permission_object=? and permission_type=? and activity_code=?",model.name,model.class.to_s,call_type])
   unless permission.nil?
     permissionrole = PermissionRole.find(:first,:conditions=>["permission_id=? and role_id=?",permission.id,role_id])
     return permissionrole.nil? ? false : permissionrole.value
   end
 end

#Process Multi-page page
def process_page(pagebody)
    pagebody = evaluate_page(pagebody,"amp;")
    pagebody = evaluate_page(pagebody)
    pagebody
  end

#evaluate page for multiple tags
  def evaluate_page(pagebody, tag="tag")
   text = pagebody.gsub("&nbsp;","")
   if tag == "tag"
    codes = text.scan(/<%=[ ]*display_rling_page\([ ]*"[a-zA-Z0-9-]*"[ ]*\)[ ]*%>/)
   else
    codes = text.scan(/&lt;%=[ ]*display_rling_page\([ ]*&quot;[a-zA-Z0-9-]*&quot;[ ]*\)[ ]*%&gt;/)
   end
   if codes.size > 0
    codes.each do |code|
     perma = code.gsub("<%=","").gsub("display_rling_page","").gsub("%>","").gsub("(","").gsub(")","").gsub("\"","").gsub("&lt;%=","").gsub("%&gt;","").gsub("&quot;","").strip
     newpage = Page.find_by_perma_link_and_status(perma.downcase,:published)
     unless newpage.nil?
       page_content = render(:partial=>"display/page_data",:locals=>{:page=>newpage})
       text = text.gsub(code,page_content)
     end
    end
    pagebody = text
   end
   return pagebody
  end

  # Display the page content for a particular page
  def display_rling_page(perma)
    newpage = Page.find_by_perma_link_and_status(perma.to_s.downcase,:published)
    unless newpage.nil?
      return render(:partial=>"display/page_data",:locals=>{:page=>newpage})
      end
  end
  #Return all the field type tags based on selection
  def return_field_tag(field_name,field_value,field_type,field_values,field_obj)
    case field_type
      when "Textfield"
        return text_field_tag("form_field[#{field_name}]",field_value)
      when "Textarea"
        return text_area_tag("form_field[#{field_name}]",field_value)
      when "RichtextEditor"
        ckoutput =  ckeditor_textarea("form_field","#{field_name}",:toolbar=>'Full',:cols=>'100',:height=>200, :rows=>'5')
        ckoutput << text_area_tag("hidden_form_field[#{field_name}]",field_value,:style=>"display:none")
        ckoutput << raw("<script language='javascript'> document.getElementById('form_field_#{field_name}_editor').value = document.getElementById('hidden_form_field_#{field_name}').value;</script>")
        return ckoutput
      when "Label"
        return field_value
      when "Dropdown"
        dropdown = field_values.split(',')
        return select_tag("form_field[#{field_name}]",options_for_select(dropdown,:selected=>field_value))
      when "Checkbox"
        return check_box_tag("form_field[#{field_name}]","1",("1"==field_value))
      when "Radiobutton"
        output = ""
        field_values.split(',').each do |radiobuttonvalue|
          output << radio_button_tag("form_field[#{field_name}]",radiobuttonvalue,(radiobuttonvalue == field_value))+radiobuttonvalue
        end
        return raw(output)
      when "Date"
        return date_select("form_field[#{field_name}]","",:default=>(Date.strptime(field_value, "%Y-%m-%d") unless field_value.blank?), :start_year=>1980)
      when "File"
        display_file = ""
        field_value = nil if field_obj.nil?
        unless field_value.blank?
          asset = Asset.find(field_value)
          display_file = link_to("#{asset.upload_file_name}", asset.upload.url,:target=>"_blank")+" "+link_to("[X]",delete_asset_user_path(field_obj.id))
        end
        return file_field_tag("form_field[#{field_name}]") + display_file
      when "Link"
        return text_field_tag("form_field[#{field_name}]",field_value)
      end
    end

end
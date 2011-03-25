module ApplicationHelper
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
      page = Page.find_by_perma_link(request.headers["REQUEST_PATH"])
      unless page.nil?
       pv = PageVariable.find_by_page_id_and_page_config_variable_id(page.id,pcv.id)
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

   def check_content_type(asset)
     case asset.upload_content_type
      when "image/jpeg"
        return image_tag(asset.upload.url(:thumb))
      when  "image/png"
        return image_tag(asset.upload.url(:thumb))
      else
        return link_to("#{asset.upload_file_name}", asset.upload.url) #"/system/assets/#{asset.id}/original/#{asset.upload_file_name}")
    end
  end
 
  
end

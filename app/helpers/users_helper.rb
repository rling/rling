module UsersHelper

	def check_field_type(user_detail_setting,user)
     user_detail_setting_value = user_detail_setting.default_value
      user_detail = UserDetail.find_by_user_id_and_user_detail_setting_id(user.id,user_detail_setting.id)
      unless user_detail.nil?
        user_detail_setting_value = user_detail.selected_value
      end

	  case user_detail_setting.field_type
    when "Textfield"
      return text_field_tag("form_field[#{user_detail_setting.field_name}]",user_detail_setting_value)
    when "Textarea"
      return text_area_tag("form_field[#{user_detail_setting.field_name}]",user_detail_setting_value)
    when "Dropdown"
      dropdown = user_detail_setting.field_values.split(',')
      return select_tag("form_field[#{user_detail_setting.field_name}]",options_for_select(dropdown,:selected=>user_detail_setting_value))
    when "Checkbox"
      return check_box_tag("form_field[#{user_detail_setting.field_name}]","1",("1"==user_detail_setting_value))
    when "Radiobutton"
      output = ""
      user_detail_setting.field_values.split(',').each do |radiobuttonvalue|
        output << radio_button_tag("form_field[#{user_detail_setting.field_name}]",radiobuttonvalue,(radiobuttonvalue == user_detail_setting_value))+radiobuttonvalue
      end
      return raw(output)
    when "File"
      display_file = ""
      user_detail_setting_value = nil if user_detail.nil?
      unless user_detail_setting_value.blank?
        asset = Asset.find(user_detail_setting_value)
        display_file = link_to("#{asset.upload_file_name}", asset.upload.url,:target=>"_blank")+" "+link_to("[X]",delete_asset_user_path(user_detail.id))
       end
       return file_field_tag("form_field[#{user_detail_setting.field_name}]") + display_file
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

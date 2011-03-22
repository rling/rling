module UsersHelper
	def check_field_type(user_detail_setting,user_detail_setting_value)
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
         return file_field_tag("form_field[#{user_detail_setting.field_name}]",)
       		end
	end
end

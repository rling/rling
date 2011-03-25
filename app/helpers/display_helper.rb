module DisplayHelper
  def check_component_type(form_component)
     form_component_value = form_component.default_value
    case form_component.component_type
    when "Textfield"
      return text_field_tag("form_field[#{form_component.component_name}]",form_component_value)
    when "Textarea"
      return text_area_tag("form_field[#{form_component.component_name}]",form_component_value)
    when "Dropdown"
      dropdown = form_component.component_values.split(',')
      return select_tag("form_field[#{form_component.component_name}]",options_for_select(dropdown,:selected=>form_component_value))
    when "Checkbox"
      return check_box_tag("form_field[#{form_component.component_name}]","1",("1"==form_component_value))
    when "Radiobutton"
      output = ""
      form_component.component_values.split(',').each do |radiobuttonvalue|
        output << radio_button_tag("form_field[#{form_component.component_name}]",radiobuttonvalue,(radiobuttonvalue == form_component_value))+radiobuttonvalue
      end
      return raw(output)
    when "File"
       return file_field_tag("form_field[#{form_component.component_name}]")
    end
  end

  def edit_component_type(form_data)
   value = form_data.data_value
   form_component = form_data.form_component
   case form_component.component_type
    when "Textfield"
      return text_field_tag("form_field[#{form_component.component_name}]",value)
    when "Textarea"
      return text_area_tag("form_field[#{form_component.component_name}]",value)
    when "Dropdown"
      dropdown = form_component.component_values.split(',')
      return select_tag("form_field[#{form_component.component_name}]",options_for_select(dropdown,:selected=>value))
    when "Checkbox"
      return check_box_tag("form_field[#{form_component.component_name}]","1",("1"==value))
    when "Radiobutton"
      output = ""
      form_component.component_values.split(',').each do |radiobuttonvalue|
        output << radio_button_tag("form_field[#{form_component.component_name}]",radiobuttonvalue,(radiobuttonvalue == value))+radiobuttonvalue
      end
      return raw(output)
    when "File"
      display_file = ""
      unless value.blank?
       asset = Asset.find(value)
       display_file = link_to("#{asset.upload_file_name}", asset.upload.url,:target=>"_blank")+" "+link_to("[X]",delete_asset_object_form_submission_form_path(form_data.submission_form.object_form,form_data.id))
       end
       return file_field_tag("form_field[#{form_component.component_name}]") + display_file
	  end
  end

end

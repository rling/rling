 module ModelSubmissionsHelper

def check_model_component_type(model_component)
     model_component_value = model_component.default_value
    case model_component.component_type
    when "Textfield"
      return text_field_tag("form_field[#{model_component.component_name}]",model_component_value)
    when "Textarea"
      return text_area_tag("form_field[#{model_component.component_name}]",model_component_value)
   
    when "Dropdown"
      dropdown = model_component.component_values.split(',')
      return select_tag("form_field[#{model_component.component_name}]",options_for_select(dropdown,:selected=>model_component_value))
    when "Checkbox"
      return check_box_tag("form_field[#{model_component.component_name}]","1",("1"==model_component_value))
    when "Radiobutton"
      output = ""
      model_component.component_values.split(',').each do |radiobuttonvalue|
        output << radio_button_tag("form_field[#{model_component.component_name}]",radiobuttonvalue,(radiobuttonvalue == model_component_value))+radiobuttonvalue
      end
      return raw(output)
    when "File"
       return file_field_tag("form_field[#{model_component.component_name}]")
    end
  end

  def edit_model_component_type(model_data)
   value = model_data.data_value
   model_component = model_data.model_component
   case model_component.component_type
    when "Textfield"
      return text_field_tag("form_field[#{model_component.component_name}]",value)
    when "Textarea"
      return text_area_tag("form_field[#{model_component.component_name}]",value)
    when "Dropdown"
      dropdown = model_component.component_values.split(',')
      return select_tag("form_field[#{model_component.component_name}]",options_for_select(dropdown,:selected=>value))
    when "Checkbox"
      return check_box_tag("form_field[#{model_component.component_name}]","1",("1"==value))
    when "Radiobutton"
      output = ""
      model_component.component_values.split(',').each do |radiobuttonvalue|
        output << radio_button_tag("form_field[#{model_component.component_name}]",radiobuttonvalue,(radiobuttonvalue == value))+radiobuttonvalue
      end
      return raw(output)
    when "File"
      display_file = ""
      unless value.blank?
       asset = Asset.find(value)
       display_file = link_to("#{asset.upload_file_name}", asset.upload.url,:target=>"_blank")+" "+link_to("[X]",delete_asset_object_model_model_submission_path(model_data.model_submission.object_model,model_data.id))
       end
       return file_field_tag("form_field[#{model_component.component_name}]") + display_file
	  end
  end

end

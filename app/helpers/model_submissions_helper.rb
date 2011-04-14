 module ModelSubmissionsHelper

   def check_model_component_type(model_component,model_submission)
      model_data=ModelData.find_by_model_submission_id_and_model_component_id(model_submission.id,model_component.id)
      
     value = ( model_submission.id.nil? ? model_component.default_value : (model_data.data_value unless model_data.nil? ))
      
    case model_component.component_type
    when "Textfield"
      return text_field_tag("form_field[#{model_component.component_name}]",value)
    when "Textarea"
      return text_area_tag("form_field[#{model_component.component_name}]",value)
    when "Label"
    
      label_tag("form_field[#{model_component.component_name}]",value)

              
    when "RichtextEditor"
      ckoutput =  ckeditor_textarea("form_field","#{model_component.component_name}",:toolbar=>'Full',:cols=>'100',:height=>200, :rows=>'5')
      ckoutput << raw("<script> $('form_field_#{model_component.component_name}_editor').value = #{value}; </script>")
      return ckoutput
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

    unless  model_submission.id.nil?
      unless value.blank?
       asset = Asset.find(value)
       display_file = link_to("#{asset.upload_file_name}", asset.upload.url,:target=>"_blank")+" "+link_to("[X]",delete_asset_object_model_model_submission_path(model_data.model_submission.object_model,model_data.id))
       end
       return file_field_tag("form_field[#{model_component.component_name}]") + display_file
     else
       return file_field_tag("form_field[#{model_component.component_name}]")
    end
 

end
   end
 end





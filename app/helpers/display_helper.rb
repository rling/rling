module DisplayHelper

def check_component_type(form_component,form_submission,data_obj)
  unless form_submission.nil?
   if data_obj == FormData      
    form_data=data_obj.find_by_form_submission_id_and_form_component_id(form_submission.id,form_component.id)
   else
    form_data=data_obj.find_by_comment_submission_id_and_comment_component_id(form_component.id,form_submission.id)
   end 
   value = (form_submission.id.nil? ? form_component.default_value : ( form_data.data_value unless form_data.nil? ) )
  else
   value=form_component.default_value
  end
  return return_field_tag(form_component.component_name,value,form_component.component_type,form_component.component_values,form_submission)
end

end



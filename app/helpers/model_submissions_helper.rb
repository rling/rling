 module ModelSubmissionsHelper

   def check_model_component_type(model_component,model_submission)
      field_obj = ModelData.find_by_model_submission_id_and_model_component_id(model_submission.id,model_component.id)
      field_value = ( model_submission.id.nil? ? model_component.default_value : (field_obj.data_value unless field_obj.nil? ))
      return return_field_tag(model_component.component_name,field_value,model_component.component_type,model_component.component_values,field_obj)
   end
 end





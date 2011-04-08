class SubmissionForm < ActiveRecord::Base
#Associations
belongs_to :object_form
has_many   :form_datas, :dependent => :destroy,:order=>"form_component_id"

#Instance methods

#Get the emailable formats as necessary for Form Submitting Emails.
def emailable_format
  output = ""
  self.form_datas.each do |form_data|
     case form_data.form_component.component_type
     when "File"
    	output << "#{form_data.form_component.component_name} :- FILEUPLOADED " 
     when "Checkbox"
	output << "#{form_data.form_component.component_name} :- " + (form_data.data_value.blank? ? "" : (form_data.data_value == "1" ? "Yes" : "No" ))
     else
        output << "#{form_data.form_component.component_name} :- #{form_data.data_value} " 
     end
     output << "\n"
  end
  return output
end

def get_variable_info(variablename)
     output = ""
     form_component = FormComponent.find_by_component_name_and_object_form_id(variablename,self.object_form_id)
     unless form_component.nil?
       form_data = FormData.find_by_submission_form_id_and_form_component_id(self.id,form_component.id)
       unless form_data.nil?
         output = form_data.data_value
       end
     end
     return output
end

end

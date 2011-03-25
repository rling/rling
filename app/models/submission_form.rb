class SubmissionForm < ActiveRecord::Base
belongs_to :object_form
has_many   :form_datas, :dependent => :destroy,:order=>"form_component_id"

def emailable_format
  output = ""
  self.form_datas.each do |form_data|
     case form_data.form_component.component_type
     when "File"
    	output << "#{form_data.form_component.component_name} :- FILEUPLOADED " 
     when "Checkbox"
	output << "#{form_data.form_component.component_name} :- " + (form_data.data_value.blank? ? "" : (form_data.data_value == 1 ? "Yes" : "No" ))
     else
        output << "#{form_data.form_component.component_name} :- #{form_data.data_value} " 
     end
     output << "\n"
  end
  return output
end

end

class FormSubmission < ActiveRecord::Base
#Associations
  belongs_to :object_form
  has_many   :form_data, :dependent => :destroy

#Class methods
 #Used to get all the Tags to create Email Template
 def self.tags(handle)
    objform = ObjectForm.where(:perma_link=>handle).first
    array = objform.form_components.collect {|fc| fc.component_name } unless objform.nil? && objform.form_components.size == 0
   return array
 end

#Instance Methods

#Format as necessary to go in the email. to check for File and Checkbox.
#this is no longer used...TO RECHECK
def emailable_format
  output = ""
  self.form_data.each do |form_data|
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

#Get the value set in a submission for a particular component. Used for display purpose
def get_variable_info(variablename)
     output = ""
     form_component = self.object_form.form_components.where(:component_name=>variablename).first()
     unless form_component.nil?
       form_data = self.form_data.where(:form_component_id=>form_component.id).first()
       output = form_data.data_value unless form_data.nil?
     end
     return output
end

end

# == Schema Information
#
# Table name: form_submissions
#
#  id             :integer(4)      not null, primary key
#  object_form_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#


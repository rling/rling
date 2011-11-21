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
     case form_data.form_component_component_type
     when "File"
       output << "#{form_data.form_component_component_name} :- FILEUPLOADED "
     when "Checkbox"
       output << "#{form_data.form_component_component_name} :- " + (form_data.data_value.blank? ? "" : (form_data.data_value == "1" ? "Yes" : "No" ))
     else
       output << "#{form_data.form_component_component_name} :- #{form_data.data_value} "
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

def self.create_form(form_datum, object_form )
  mandatoryfailed = false
      object_form.form_components.each do |component|
        if component.mandatory && form_datum[component.component_name].blank?
          mandatoryfailed = true
          break;
        end
      end
      unless mandatoryfailed
        submission = FormSubmission.create(:object_form_id=>object_form.id)
        object_form.form_components.each do |component|
        case component.component_type
          when "File"
            unless form_datum[component.component_name].nil?
              asset = Asset.create(:sizes=>component.default_value,:upload=>form_datum[component.component_name])
              FormDatum.create(:form_submission_id=>submission.id,:form_component_id=>component.id,:data_value=>asset.id.to_s)
            end
        else
            FormDatum.create(:form_submission_id=>submission.id,:form_component_id=>component.id,:data_value=>form_datum[component.component_name])
        end
        end
        message = t(:object_form_stored)
        Notifier.form_submitted(submission).deliver unless object_form.email.blank?
      else
        message = t(:mandatory_fields_required)
      end
    flash[:notice] = message
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


class FormData < ActiveRecord::Base
  #Associations
  belongs_to :form_component
  belongs_to :form_submission

  #instance methods

  #get all the tags which are necessary to be included in the email template for the particular submission.
  # VERIFY IF THIS IS NECESSARY
  def self.tags(handle)
    objform = ObjectForm.find_by_perma_link(handle)
    array = objform.form_components.collect {|fc| fc.component_name } unless objform.nil? && objform.form_components.size == 0
   return array
  end

end

# == Schema Information
#
# Table name: form_data
#
#  id                 :integer(4)      not null, primary key
#  form_component_id  :integer(4)
#  data_value         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  form_submission_id :integer(4)
#


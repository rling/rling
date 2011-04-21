class FormDatum < ActiveRecord::Base
  #Associations
  belongs_to :form_component
  belongs_to :form_submission

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


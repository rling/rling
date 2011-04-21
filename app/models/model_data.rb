class ModelData < ActiveRecord::Base
#Includes
 stampable

  #Associations
  belongs_to :model_component
  belongs_to :model_submission

end


# == Schema Information
#
# Table name: model_data
#
#  id                  :integer(4)      not null, primary key
#  model_component_id  :integer(4)
#  model_submission_id :integer(4)
#  data_value          :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  creator_id          :integer(4)
#  updater_id          :integer(4)
#


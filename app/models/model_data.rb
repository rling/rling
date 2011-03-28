class ModelData < ActiveRecord::Base
  #Associations
  belongs_to :model_component
  belongs_to :model_submission

end

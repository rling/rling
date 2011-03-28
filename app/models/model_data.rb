class ModelData < ActiveRecord::Base
  belongs_to :model_component
  belongs_to :model_submission

end

class ModelComponent < ActiveRecord::Base
  #Associations
  belongs_to :object_model
  has_many   :model_datas ,:dependent => :destroy
  #Validations
  validates :component_name, :presence=>true,:uniqueness=>true,:length=>{:minimum=>3}
  validates :component_type, :presence=>true
  validates :component_display_name, :presence=>true
end

class ModelComponent < ActiveRecord::Base
  belongs_to :object_model
  has_many   :model_datas ,:dependent => :destroy
  validates :component_name, :presence=>true,:uniqueness=>true,:length=>{:minimum=>3}
  validates :component_type, :presence=>true
  validates :component_display_name, :presence=>true
end

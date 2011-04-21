class ModelComponent < ActiveRecord::Base
  #Associations
  belongs_to :object_model
  has_many   :model_datas ,:dependent => :destroy

  #Validations
  validates :component_name, :presence=>true,:length=>{:minimum=>3}
  validates :component_type, :presence=>true
  validates :component_display_name, :presence=>true
end

# == Schema Information
#
# Table name: model_components
#
#  id                     :integer(4)      not null, primary key
#  object_model_id        :integer(4)
#  component_name         :string(255)
#  component_display_name :string(255)
#  component_type         :string(255)
#  component_values       :text
#  default_value          :text
#  is_mandatory           :boolean(1)      default(FALSE)
#  is_deletable           :boolean(1)      default(TRUE)
#  created_at             :datetime
#  updated_at             :datetime
#  position               :integer(4)      default(0)
#


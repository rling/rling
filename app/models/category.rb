class Category < ActiveRecord::Base
  #Associations
  belongs_to :categoryset
  belongs_to :object_model

  #Validations
  validates :name, :presence=>true
end

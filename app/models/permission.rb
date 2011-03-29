class Permission < ActiveRecord::Base
  #Associations
  belongs_to :role

  #Validations
  name_regex = /^[a-zA-Z0-9]+$/
  validates :activity_code,:presence=>true, :format=> {:with => name_regex }
end

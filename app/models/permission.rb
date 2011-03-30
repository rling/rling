class Permission < ActiveRecord::Base
  #Associations
  has_many :permission_roles, :dependent=>:destroy

  #Validations
  name_regex = /^[a-zA-Z0-9]+$/
  validates :activity_code,:presence=>true, :format=> {:with => name_regex }
end

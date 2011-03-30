class Role < ActiveRecord::Base
#Associations
  has_many :users
  has_many :permission_roles, :dependent=>:destroy
#Validations
  validates :role_type, :presence=> true, :uniqueness=>true

#Class Methods
  # Allows us to look up roles by passing a symbol, eg. Role.by_name(:admin)
	  def self.by_role_type(name)
	    self.find_by_role_type(name.to_s.camelize)
	  end
end

# == Schema Information
#
# Table name: roles
#
#  id           :integer(4)      not null, primary key
#  role_type    :string(255)
#  is_deletable :boolean(1)      default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#


class Role < ActiveRecord::Base
#Associations
  has_many :users

#Validations
  validates :role_type, :presence=> true, :uniqueness=>true

#Class Methods
  # Allows us to look up roles by passing a symbol, eg. Role.by_name(:admin)
	  def self.by_role_type(name)
	    self.find_by_role_type(name.to_s.camelize)
	  end
end

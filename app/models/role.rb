class Role < ActiveRecord::Base
  has_many :users
  validates :role_type, :presence=> true, :uniqueness=>true

  # Allows us to look up roles by passing a symbol, eg. Role.by_name(:admin)
	  def self.by_role_type(name)
	    self.find_by_role_type(name.to_s.camelize)
	  end
end

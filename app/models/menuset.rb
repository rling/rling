class Menuset < ActiveRecord::Base
#Associations
  has_many :menus
#Validations
  validates :name ,:presence=>true,:uniqueness=>true
#Instance Methods
  def levelname 
    treelevel
  end

  def treename
    treelevel
  end

  def treelevel
# The negative number is necessary because when we display the drop down in menu and page forms, we use the menuset's id as negative
 self.id = -(self.id) unless self.id.nil?
   lname = self.name
   lname
  end
end

# == Schema Information
#
# Table name: menusets
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#


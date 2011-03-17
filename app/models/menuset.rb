class Menuset < ActiveRecord::Base
  has_many :menus
  validates :name ,:uniqueness=>true

  def levelname 
    treelevel
  end

  def treename
    treelevel
  end

  def treelevel
 self.id = -(self.id)
   lname = self.name
   lname
  end
end

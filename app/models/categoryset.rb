class Categoryset < ActiveRecord::Base
  #Associations
  has_many :categories
  has_many :object_models

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
   self.id = -(self.id) unless self.id.nil?
   lname = self.name
   lname
  end
end

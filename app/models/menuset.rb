class Menuset < ActiveRecord::Base
  has_many :menus
  validates :name ,:presence =>true,:uniqueness=>true
end

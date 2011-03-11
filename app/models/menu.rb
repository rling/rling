class Menu < ActiveRecord::Base
  belongs_to :menuset
  belongs_to :page
  validates :name ,:presence=>true
  validates :menuset_id ,:presence=>true
  validates :menu_view_type, :presence=>true
end

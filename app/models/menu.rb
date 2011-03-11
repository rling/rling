class Menu < ActiveRecord::Base
  belongs_to :menuset
  belongs_to :page
  validates :name ,:presence=>true
  validates :menuset_id ,:presence=>true
  validates :menu_view_type, :presence=>true
  acts_as_tree :order => :position
  before_save :set_level
  before_destroy :set_children


  def levelname
    lname = ""
    self.level.times do
      lname << "-- "
    end
    lname << name
    lname = "" if lname.blank?
    lname
  end


  def treename
    return self.name
  end


private

  def set_children() 
    Menu.find_all_by_parent_id(self.id).each do |menu|
      menu.update_attribute("parent_id",nil)
    end	 
  end


  def set_level
    unless self.parent_id.nil?
      if self.parent_id < 0
        self.menuset_id = self.parent_id.abs
        self.parent_id = 0
        self.level = 0
      else
        unless self.parent.nil?
        self.menuset_id = self.parent.menuset_id
        end
      end
      if self.parent_id == 0
        self.level = 1
      else
        self.level = Menu.find_by_id(self.parent_id).level + 1
      end
  end

end

end

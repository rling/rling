class Menu < ActiveRecord::Base
  belongs_to :menuset
  belongs_to :page

  validates :name, :presence=>true
  validates :menu_view_type, :presence=>true
 
  before_save :set_level
  before_destroy :set_children

  acts_as_tree :order => :position


  def levelname
    lname = ""
    self.level.times do
      lname << "--"
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
    if self.parent_id < 0
      self.level = 1
      self.menuset_id = self.parent_id.abs
      self.parent_id = 0
    elsif self.parent_id > 0
      self.level = self.parent.level + 1
      self.menuset_id = self.parent.menuset_id
    end
  end

end

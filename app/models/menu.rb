class Menu < ActiveRecord::Base
#Associations
  belongs_to :menuset
  belongs_to :page

#Validations
  validates :name, :presence=>true
  validates :menu_view_type, :presence=>true

#Callbacks
  before_save :set_level
  before_destroy :set_children

#Additions
  acts_as_tree :order => :position

#Instance Methods
  def levelname
    lname = ""
    self.level.times {lname << "--"}
    lname << name
    lname = "" if lname.blank?
    lname
  end

  def treename
    return self.name
  end

#Private Methods
private

  def set_children()
    Menu.where(:parent_id=>self.id).each do |menu|
      menu.update_attribute("parent_id",nil)
    end
  end

  def set_level
   unless self.parent_id.nil?
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

end

# == Schema Information
#
# Table name: menus
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  position         :integer(4)      default(0)
#  level            :integer(4)      default(0)
#  image_path       :string(255)
#  hover_image_path :string(255)
#  link_path        :string(255)
#  parent_id        :integer(4)      default(0)
#  menuset_id       :integer(4)
#  page_id          :integer(4)
#  menu_view_type   :integer(4)      default(0)
#  created_at       :datetime
#  updated_at       :datetime
#


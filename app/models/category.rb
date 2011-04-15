class Category < ActiveRecord::Base
  #Associations
  belongs_to :categoryset
  has_many :categorizations, :dependent=> :destroy
  has_many :model_submissions, :through=> :categorizations
  #Validations
  validates :name, :presence=>true

  #Callbacks
  before_save :set_level
  before_destroy :set_children

  #Additions
  acts_as_tree :order => :position

  #Instance Methods
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

  #Private Methods
  private

  def set_children()
    Category.find_all_by_parent_id(self.id).each do |category|
      category.update_attribute("parent_id",nil)
    end
  end

  def set_level
   unless self.parent_id.nil?
    if self.parent_id < 0
      self.level = 1
      self.categoryset_id = self.parent_id.abs
      self.parent_id = 0
    elsif self.parent_id > 0
      self.level = self.parent.level + 1
      self.categoryset_id = self.parent.categoryset_id
    end
  end
  end
end

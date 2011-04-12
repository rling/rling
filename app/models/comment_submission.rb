class CommentSubmission < ActiveRecord::Base
   stampable

  #Associations
  has_many :comment_datas ,:dependent=>:destroy
  belongs_to :model_submission
  before_save :set_level
  before_destroy :set_children

 #Additions
  acts_as_tree :order => :level


  private

  def set_children() 
    CommentSubmission.find_all_by_parent_id(self.id).each do |comment_submission|
      comment_submission.update_attribute("parent_id",nil)
    end	 
  end

  def set_level
   unless self.parent_id.nil?
    if self.parent_id == 0
      self.level = 1
      self.parent_id = 0
    elsif self.parent_id > 0
      self.level = self.parent.level + 1
    end
  end
 end


end

class CommentSubmission < ActiveRecord::Base
  include CacheHelper
   stampable

  #Associations
  has_many :comment_datas ,:dependent=>:destroy
  belongs_to :model_submission
  before_save :set_level
  before_destroy :set_children

 #Additions
  acts_as_tree

   #callbacks
  after_create  :clear_cache
  after_update  :clear_cache
  after_destroy :clear_cache


  private

  def set_children() 
    CommentSubmission.find_all_by_parent_id(self.id).each do |comment_submission|
      comment_submission.destroy
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

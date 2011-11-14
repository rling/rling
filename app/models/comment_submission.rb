class CommentSubmission < ActiveRecord::Base
#Includes
  include CacheHelper
  stampable

  #Associations
  has_many :comment_data ,:dependent=>:destroy
  belongs_to :model_submission

  #Additions
  acts_as_tree

  #callbacks
  after_create  :clear_cache,:send_email
  after_update  :clear_cache
  after_destroy :clear_cache
  before_save :set_level
  before_destroy :set_children

   def self.tags(handle)
   object_model = ObjectModel.where(:perma_link_parent=>handle).first
   array = object_model.comment_components.collect {|cc| cc.component_name } unless object_model.nil? && object_model.comment_components.size == 0

   return array
   end

   def send_email
    Notifier.comment_submitted(self).deliver if self.model_submission.object_model.email_on_comment
  end

   def get_variable_info(variablename)
     output = ""
    comment_component = self.model_submission.object_model.comment_components.find(:first,:conditions=>["component_name=?",variablename])
     unless comment_component.nil?
       comment_data = self.comment_data.find(:first,:conditions=>["comment_component_id=?",comment_component.id])
       output = comment_data.data_value  unless comment_data.nil?
     end
     return output
end

  private

  def set_children()
    CommentSubmission.find_all_by_parent_id(self.id).destroy_all
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

# == Schema Information
#
# Table name: comment_submissions
#
#  id                  :integer(4)      not null, primary key
#  model_submission_id :integer(4)
#  parent_id           :integer(4)
#  creator_id          :integer(4)
#  updater_id          :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  level               :integer(4)      default(0)
#


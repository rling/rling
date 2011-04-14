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
  after_create  :clear_cache,:send_email

  after_update  :clear_cache
  after_destroy :clear_cache

   def self.tags(handle)
   object_model = ObjectModel.find_by_perma_link_parent(handle)
    array = object_model.comment_components.collect {|cc| cc.component_name } unless object_model.nil? && object_model.comment_components.size == 0
 
   return array
   end


   def send_email
    if self.model_submission.object_model.email_on_comment
      Notifier.comment_submitted(self).deliver
    end
  end


   def get_variable_info(variablename)
     output = ""
    comment_component = self.model_submission.object_model.comment_components.find(:first,:conditions=>["component_name=?",variablename])
     unless comment_component.nil?
       comment_data = self.comment_datas.find(:first,:conditions=>["comment_component_id=?",comment_component.id])
       unless comment_data.nil?
         output = comment_data.data_value
       end
     end
     return output
end
  
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

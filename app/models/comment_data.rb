class CommentData < ActiveRecord::Base
  #Associations
  belongs_to :comment_component
  belongs_to :comment_submission

end

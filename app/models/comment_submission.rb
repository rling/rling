class CommentSubmission < ActiveRecord::Base
   stampable

  #Associations
  has_many :comment_datas ,:dependent=>:destroy
  belongs_to :model_submission
end

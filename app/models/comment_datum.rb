class CommentDatum < ActiveRecord::Base
  #Associations
  belongs_to :comment_component
  belongs_to :comment_submission

end

# == Schema Information
#
# Table name: comment_data
#
#  id                    :integer(4)      not null, primary key
#  comment_component_id  :integer(4)
#  comment_submission_id :integer(4)
#  data_value            :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#


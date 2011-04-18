class Categorization < ActiveRecord::Base
  #Associations
  belongs_to :category
  belongs_to :model_submission
end

# == Schema Information
#
# Table name: categorizations
#
#  id                  :integer(4)      not null, primary key
#  model_submission_id :integer(4)
#  category_id         :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#


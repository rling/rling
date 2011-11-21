class UserDetail < ActiveRecord::Base
#Associations
 belongs_to :user
 belongs_to :user_detail_setting

def self.user_value(user_detail)
  !user_detail.selected_value.blank? && user_detail.selected_value.to_i != 0
end
end

# == Schema Information
#
# Table name: user_details
#
#  id                     :integer(4)      not null, primary key
#  user_id                :integer(4)
#  user_detail_setting_id :integer(4)
#  selected_value         :text
#  created_at             :datetime
#  updated_at             :datetime
#


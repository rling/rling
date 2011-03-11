class UserDetail < ActiveRecord::Base
#Association
 belongs_to :user
 belongs_to :user_detail_setting
end

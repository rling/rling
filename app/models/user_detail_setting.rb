class UserDetailSetting < ActiveRecord::Base
#Association
  has_many :user_details,:dependent=>:destroy
#validation
  validates :field_name,:presence=>true,:uniqueness=>true
  validates :field_type,:presence=>true
end

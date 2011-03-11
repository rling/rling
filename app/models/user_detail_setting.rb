class UserDetailSetting < ActiveRecord::Base
#Association
  has_many :user_details,:dependent=>:destroy
#Attribute
  
#validation
  name_regex = /^[a-zA-Z]+$/
  validates :field_name, :presence=>true,:uniqueness=>true,:length=>{:minimum=>3,:maximum=>8},
            :format=> {:with => name_regex }
  validates :field_type, :presence=>true
end

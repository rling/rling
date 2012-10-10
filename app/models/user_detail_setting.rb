class UserDetailSetting < ActiveRecord::Base
#Associations
  has_many :user_details,:dependent=>:destroy
#Scope
 scope :all,  :order=>"position"
  
#Validation
  name_regex = /^[a-zA-Z0-9_]+$/
  validates :field_name, :presence=>true,:uniqueness=>true,:length=>{:minimum=>3},
            :format=> {:with => name_regex }
  validates :field_type, :presence=>true
end


# == Schema Information
#
# Table name: user_detail_settings
#
#  id            :integer(4)      not null, primary key
#  field_name    :string(255)
#  field_type    :string(255)
#  field_values  :text
#  default_value :string(255)
#  mandatory     :boolean(1)      default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#  position      :integer(4)      default(0)
#


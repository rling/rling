class Permission < ActiveRecord::Base
  #Associations
  has_many :permission_roles, :dependent=>:destroy

  #Validations
  name_regex = /^[a-zA-Z0-9]+$/
  validates :activity_code,:presence=>true, :format=> {:with => name_regex }
end

# == Schema Information
#
# Table name: permissions
#
#  id                    :integer(4)      not null, primary key
#  permission_object     :string(255)
#  permission_type       :string(255)
#  activity_code         :string(255)
#  activity_display_text :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#


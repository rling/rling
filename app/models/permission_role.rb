class PermissionRole < ActiveRecord::Base
#Associations
  belongs_to :role
  belongs_to :permission
end

# == Schema Information
#
# Table name: permission_roles
#
#  id            :integer(4)      not null, primary key
#  permission_id :integer(4)
#  role_id       :integer(4)
#  value         :boolean(1)
#  created_at    :datetime
#  updated_at    :datetime
#


class PermissionRole < ActiveRecord::Base
#Associations
  belongs_to :role
  belongs_to :permission

def self.create_role(k,k1)
  pr=PermissionRole.new
  pr.permission_id=k
  pr.role_id=k1
  pr.value=true
  pr.save
end

def self.by_permission_role(permission,role_id)
  self.find(:first,:conditions=>["permission_id=? and role_id=?",permission.id,role_id])
end
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


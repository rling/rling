require 'spec_helper'

describe PermissionRole do
  before(:each) do
    @permission=Permission.create!(:permission_object=>'test1',:permission_type=>'perm',:activity_code=>'test123',:activity_display_text=>'this is for test purpose')
    @role=Role.create!(:role_type=>'admin',:is_deletable=>'false')
    @permission_role = PermissionRole.new
  end

  it "should save permission_roles, given valid attributes" do
    permission_role=PermissionRole.new(:permission_id=>'1',:role_id=>'2',:value=>true)
    permission_role.should be_valid
  end

  it "should belongs to role" do
    @permission_role.role.should be_nil
    @permission_role.role=@role
    @permission_role.role.should eql(@role)
  end

  it "should belongs to permission" do
    @permission_role.permission.should be_nil
    @permission_role.permission=@permission
    @permission_role.permission.should eql(@permission)
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


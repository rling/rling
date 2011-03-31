require 'spec_helper'

describe PermissionRole do
  it "should save permission_roles, given valid attributes" do
    permission_role=PermissionRole.new(:permission_id=>'1',:role_id=>'2',:value=>true)
    permission_role.should be_valid
  end
end

require 'spec_helper'

describe Role do

  it "is not valid without a role_type" do
    role = Role.new(:role_type => '')
    role.should_not be_valid
    role.errors[:role_type].should include("can't be blank")
  end

  it "should have unique role_type" do
    Role.create!(:role_type=>"admin")
    role=Role.new(:role_type=>"admin")
    role.should_not be_valid
    role.errors[:role_type].should include("has already been taken")
  end
  
  it 'should return the correct role when *by_name* is called' do
    user_role = Role.new({:role_type => 'User'})
    user_role.save
    Role.by_role_type(:user).id.should == user_role.id
  end

  it "should take default value true for 'is_deletable'" do
    role=Role.new(@attr)
    role.is_deletable.should== true
  end

#validating associations
  it "should have a users attribute" do
    role=Role.create!(:role_type=>'test')
    role.should respond_to(:users)
  end

  it "should destroy associated permissions on its deletion" do
    role=Role.create!(:role_type=>"test")
    permission=Permission.create!(:role_id=>role.id,:permission_object=>'page',:permission_type=>'page',:activity_code=>'create')
    role.destroy
    Permission.find_by_id(permission.id).should be_nil
  end
   
end

# == Schema Information
#
# Table name: roles
#
#  id           :integer(4)      not null, primary key
#  role_type    :string(255)
#  is_deletable :boolean(1)      default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#


require 'spec_helper'

describe Role do
  it "is not valid without a role_type" do
    role = Role.new(:role_type => '')
    role.should_not be_valid
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
   
end

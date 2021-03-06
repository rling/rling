require 'spec_helper'

describe Permission do
   before(:each) do
       @attr={:activity_code=>'create'}
       @permission=Permission.create!(@attr)
   end

  it "should create a new permission given valid attributes" do
    permission=Permission.new(@attr)
    permission.should be_valid
  end

  it "should have an activity_code" do
    permission=Permission.new(@attr.merge(:activity_code=>''))
    permission.should_not be_valid
  end

  it "should accept characters from a..z,0-9 and A..Z" do
    names = %w[sandeep sharma sandeep018]
    names.each do |name|
      valid_activity_code = Permission.new(@attr.merge(:activity_code => name))
      valid_activity_code.should be_valid
    end
  end

  it "should not accept characters other than a..z,0-9 and A..Z" do
    names = %w[sandeep@tezpur sandee% sandeep_18]
    names.each do |name|
      invalid_activity_code = Permission.new(@attr.merge(:activity_code => name))
      invalid_activity_code.should_not be_valid
    end
  end

  it "should have many permission roles" do
    @permission.permission_roles<< PermissionRole.new(:permission_id=>@permission.id)
    @permission.permission_roles<< PermissionRole.new(:permission_id=>@permission.id)
    @permission.should have(2).permission_roles
  end
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


require 'spec_helper'

describe UserDetailSetting do
   before(:each) do
       @attr={:field_name=>"name",:field_type=>'textbox'}
       @user_detail_setting = UserDetailSetting.new(:field_name=>'test',:field_type=>'textbox')
       @user_detail = UserDetail.new(:user_id=>1,:user_detail_setting_id=>@user_detail_setting.id,:selected_value=>"test")
   end

  it "should reject duplicate field_name" do
    UserDetailSetting.create!(@attr)
    duplicate_field_name = UserDetailSetting.new(@attr)
    duplicate_field_name.should_not be_valid
  end


  it "should contain field_name" do
   user_detail_setting = UserDetailSetting.new :field_name => nil
   user_detail_setting.should_not be_valid
  end

  it "should contain field_type" do
   user_detail_setting = UserDetailSetting.new :field_type => nil
   user_detail_setting.should_not be_valid
  end

  it "should destroy associated userdetail" do
   @user_detail_setting.destroy
   UserDetail.find_by_id(@user_detail.id).should be_nil
  end

  it "should contain default false in mandatory field" do
   user_detail_setting=UserDetailSetting.new
   user_detail_setting.mandatory.should==false
  end

  it "should contain many associated userdetail" do
   @user_detail_setting.user_details<< UserDetail.new(:user_detail_setting_id=>@user_detail_setting.id)
   @user_detail_setting.user_details<< UserDetail.new(:user_detail_setting_id=>@user_detail_setting.id)
   @user_detail_setting.should have(2).user_details
  end

  it "validates length of field_name minimum 3 characters" do
    name = 'a' * 2
    field_name = UserDetailSetting.new(@attr.merge(:field_name=> name))
    field_name.valid?.should be_false
  end

  it "validates length of field_name maximum 10 characters" do
    name = 'a' * 11
    field_name = UserDetailSetting.new(@attr.merge(:field_name=> name))
    field_name.valid?.should be_false
  end

  it "should accept characters from a..z and A..Z" do
    names = %w[ravi kiran]
    names.each do |name|
      valid_field_name = UserDetailSetting.new(@attr.merge(:field_name => name))
      valid_field_name.should be_valid
    end
  end

  it "should not accept characters other than a..z and A..Z" do
    names = %w[ravi@11 Ravi.k ravi_com]
    names.each do |name|
      invalid_field_name = UserDetailSetting.new(@attr.merge(:field_name => name))
      invalid_field_name.should_not be_valid
    end 
  end

  it "should order by position" do
    @user_detail_setting1 = UserDetailSetting.new(:field_name=>'test1',:field_type=>'textbox',:position=>'1')
    @user_detail_setting2 = UserDetailSetting.new(:field_name=>'test2',:field_type=>'textbox',:position=>'0')
    @user_detail.user_detail_setting.should == [@user_detail_setting2,@user_detail_setting1]
  end

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


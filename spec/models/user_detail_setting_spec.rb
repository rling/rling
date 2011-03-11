require 'spec_helper'

describe UserDetailSetting do
   before(:each) do
       @attr={:field_name=>"test",:field_type=>'textbox'}
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



end

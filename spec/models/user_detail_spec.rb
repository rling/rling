require 'spec_helper'

describe UserDetail do
  before(:each) do
    @user_detail_setting = UserDetailSetting.new(:field_name=>'test',:field_type=>'textbox')
    @user_detail = UserDetail.new(:user_id=>1,:user_detail_setting_id=>@user_detail_setting.id,:selected_value=>"test")
  end

  it "should have the right associated userdetailsetting" do
    @user_detail.user_detail_setting_id.should == @user_detail_setting.id 
  end
end

# == Schema Information
#
# Table name: user_details
#
#  id                     :integer(4)      not null, primary key
#  user_id                :integer(4)
#  user_detail_setting_id :integer(4)
#  selected_value         :text
#  created_at             :datetime
#  updated_at             :datetime
#


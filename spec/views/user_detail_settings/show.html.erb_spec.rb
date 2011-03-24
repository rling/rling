require 'spec_helper'

describe "user_detail_settings/show.html.erb" do
  before(:each) do
    @user_detail_setting = assign(:user_detail_setting, stub_model(UserDetailSetting))
  end

  it "renders attributes in <p>" do
    render
  end
end

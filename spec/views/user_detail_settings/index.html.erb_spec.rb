require 'spec_helper'

describe "user_detail_settings/index.html.erb" do
  before(:each) do
    assign(:user_detail_settings, [
      stub_model(UserDetailSetting),
      stub_model(UserDetailSetting)
    ])
  end

  it "renders a list of user_detail_settings" do
    render
  end
end

require 'spec_helper'

describe "user_detail_settings/edit.html.erb" do
  before(:each) do
    @user_detail_setting = assign(:user_detail_setting, stub_model(UserDetailSetting))
  end

  it "renders the edit user_detail_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_detail_settings_path(@user_detail_setting), :method => "post" do
    end
  end
end

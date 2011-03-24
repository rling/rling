require 'spec_helper'

describe "user_detail_settings/new.html.erb" do
  before(:each) do
    assign(:user_detail_setting, stub_model(UserDetailSetting).as_new_record)
  end

  it "renders new user_detail_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_detail_settings_path, :method => "post" do
    end
  end
end

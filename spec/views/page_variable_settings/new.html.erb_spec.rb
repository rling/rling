require 'spec_helper'

describe "page_variable_settings/new.html.erb" do
  before(:each) do
    assign(:page_variable_setting, stub_model(PageVariableSetting,
      :name => "MyString",
      :default_value => "MyText"
    ).as_new_record)
  end

  it "renders new page_variable_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => page_variable_settings_path, :method => "post" do
      assert_select "input#page_variable_setting_name", :name => "page_variable_setting[name]"
      assert_select "textarea#page_variable_setting_default_value", :name => "page_variable_setting[default_value]"
    end
  end
end

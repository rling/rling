require 'spec_helper'

describe "page_variable_settings/edit.html.erb" do
  before(:each) do
    @page_variable_setting = assign(:page_variable_setting, stub_model(PageVariableSetting,
      :name => "MyString",
      :default_value => "MyText"
    ))
  end

  it "renders the edit page_variable_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => page_variable_settings_path(@page_variable_setting), :method => "post" do
      assert_select "input#page_variable_setting_name", :name => "page_variable_setting[name]"
      assert_select "textarea#page_variable_setting_default_value", :name => "page_variable_setting[default_value]"
    end
  end
end

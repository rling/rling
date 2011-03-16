require 'spec_helper'

describe "page_variable_settings/show.html.erb" do
  before(:each) do
    @page_variable_setting = assign(:page_variable_setting, stub_model(PageVariableSetting,
      :name => "Name",
      :default_value => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end

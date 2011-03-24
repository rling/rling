require 'spec_helper'

describe "page_variable_settings/index.html.erb" do
  before(:each) do
    assign(:page_variable_settings, [
      stub_model(PageVariableSetting,
        :name => "Name",
        :default_value => "MyText"
      ),
      stub_model(PageVariableSetting,
        :name => "Name",
        :default_value => "MyText"
      )
    ])
  end

  it "renders a list of page_variable_settings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

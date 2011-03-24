require 'spec_helper'

describe "form_components/index.html.erb" do
  before(:each) do
    assign(:form_components, [
      stub_model(FormComponent,
        :object_form_id => 1,
        :component_name => "Component Name",
        :component_type => "Component Type",
        :component_values => "MyText",
        :default_value => "Default Value",
        :mandatory => false
      ),
      stub_model(FormComponent,
        :object_form_id => 1,
        :component_name => "Component Name",
        :component_type => "Component Type",
        :component_values => "MyText",
        :default_value => "Default Value",
        :mandatory => false
      )
    ])
  end

  it "renders a list of form_components" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Component Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Component Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Default Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

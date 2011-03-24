require 'spec_helper'

describe "form_components/show.html.erb" do
  before(:each) do
    @form_component = assign(:form_component, stub_model(FormComponent,
      :object_form_id => 1,
      :component_name => "Component Name",
      :component_type => "Component Type",
      :component_values => "MyText",
      :default_value => "Default Value",
      :mandatory => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Component Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Component Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Default Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end

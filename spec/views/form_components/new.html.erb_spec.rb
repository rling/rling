require 'spec_helper'

describe "form_components/new.html.erb" do
  before(:each) do
    assign(:form_component, stub_model(FormComponent,
      :object_form_id => 1,
      :component_name => "MyString",
      :component_type => "MyString",
      :component_values => "MyText",
      :default_value => "MyString",
      :mandatory => false
    ).as_new_record)
  end

  it "renders new form_component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => form_components_path, :method => "post" do
      assert_select "input#form_component_object_form_id", :name => "form_component[object_form_id]"
      assert_select "input#form_component_component_name", :name => "form_component[component_name]"
      assert_select "input#form_component_component_type", :name => "form_component[component_type]"
      assert_select "textarea#form_component_component_values", :name => "form_component[component_values]"
      assert_select "input#form_component_default_value", :name => "form_component[default_value]"
      assert_select "input#form_component_mandatory", :name => "form_component[mandatory]"
    end
  end
end

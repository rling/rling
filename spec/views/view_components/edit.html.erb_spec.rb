require 'spec_helper'

describe "view_components/edit.html.erb" do
  before(:each) do
    @view_component = assign(:view_component, stub_model(ViewComponent,
      :view_id => 1,
      :name => "MyString",
      :is_linked => false
    ))
  end

  it "renders the edit view_component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => view_components_path(@view_component), :method => "post" do
      assert_select "input#view_component_view_id", :name => "view_component[view_id]"
      assert_select "input#view_component_name", :name => "view_component[name]"
      assert_select "input#view_component_is_linked", :name => "view_component[is_linked]"
    end
  end
end

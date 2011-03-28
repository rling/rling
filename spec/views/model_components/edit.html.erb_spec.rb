require 'spec_helper'

describe "model_components/edit.html.erb" do
  before(:each) do
    @model_component = assign(:model_component, stub_model(ModelComponent))
  end

  it "renders the edit model_component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => model_components_path(@model_component), :method => "post" do
    end
  end
end

require 'spec_helper'

describe "model_components/new.html.erb" do
  before(:each) do
    assign(:model_component, stub_model(ModelComponent).as_new_record)
  end

  it "renders new model_component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => model_components_path, :method => "post" do
    end
  end
end

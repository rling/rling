require 'spec_helper'

describe "object_models/edit.html.erb" do
  before(:each) do
    @object_model = assign(:object_model, stub_model(ObjectModel))
  end

  it "renders the edit object_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => object_models_path(@object_model), :method => "post" do
    end
  end
end

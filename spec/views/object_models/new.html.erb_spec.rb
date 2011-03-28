require 'spec_helper'

describe "object_models/new.html.erb" do
  before(:each) do
    assign(:object_model, stub_model(ObjectModel).as_new_record)
  end

  it "renders new object_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => object_models_path, :method => "post" do
    end
  end
end

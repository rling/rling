require 'spec_helper'

describe "object_models/show.html.erb" do
  before(:each) do
    @object_model = assign(:object_model, stub_model(ObjectModel))
  end

  it "renders attributes in <p>" do
    render
  end
end

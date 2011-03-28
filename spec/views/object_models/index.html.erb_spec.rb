require 'spec_helper'

describe "object_models/index.html.erb" do
  before(:each) do
    assign(:object_models, [
      stub_model(ObjectModel),
      stub_model(ObjectModel)
    ])
  end

  it "renders a list of object_models" do
    render
  end
end

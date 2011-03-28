require 'spec_helper'

describe "model_components/index.html.erb" do
  before(:each) do
    assign(:model_components, [
      stub_model(ModelComponent),
      stub_model(ModelComponent)
    ])
  end

  it "renders a list of model_components" do
    render
  end
end

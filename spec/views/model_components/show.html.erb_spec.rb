require 'spec_helper'

describe "model_components/show.html.erb" do
  before(:each) do
    @model_component = assign(:model_component, stub_model(ModelComponent))
  end

  it "renders attributes in <p>" do
    render
  end
end

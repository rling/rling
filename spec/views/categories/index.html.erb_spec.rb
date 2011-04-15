require 'spec_helper'

describe "categories/index.html.erb" do
  before(:each) do
    assign(:categories, [
      stub_model(Category),
      stub_model(Category)
    ])
  end

  it "renders a list of categories" do
    render
  end
end

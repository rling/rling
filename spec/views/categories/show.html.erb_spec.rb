require 'spec_helper'

describe "categories/show.html.erb" do
  before(:each) do
    @category = assign(:category, stub_model(Category))
  end

  it "renders attributes in <p>" do
    render
  end
end

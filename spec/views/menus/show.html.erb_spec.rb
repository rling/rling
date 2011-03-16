require 'spec_helper'

describe "menus/show.html.erb" do
  before(:each) do
    @menu = assign(:menu, stub_model(Menu))
  end

  it "renders attributes in <p>" do
    render
  end
end

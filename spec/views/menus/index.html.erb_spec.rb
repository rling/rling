require 'spec_helper'

describe "menus/index.html.erb" do
  before(:each) do
    assign(:menus, [
      stub_model(Menu),
      stub_model(Menu)
    ])
  end

  it "renders a list of menus" do
    render
  end
end

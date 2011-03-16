require 'spec_helper'

describe "menus/edit.html.erb" do
  before(:each) do
    @menu = assign(:menu, stub_model(Menu))
  end

  it "renders the edit menu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menus_path(@menu), :method => "post" do
    end
  end
end

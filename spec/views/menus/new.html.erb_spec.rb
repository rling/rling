require 'spec_helper'

describe "menus/new.html.erb" do
  before(:each) do
    assign(:menu, stub_model(Menu).as_new_record)
  end

  it "renders new menu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menus_path, :method => "post" do
    end
  end
end

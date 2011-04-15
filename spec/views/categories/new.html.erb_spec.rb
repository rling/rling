require 'spec_helper'

describe "categories/new.html.erb" do
  before(:each) do
    assign(:category, stub_model(Category).as_new_record)
  end

  it "renders new category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categories_path, :method => "post" do
    end
  end
end

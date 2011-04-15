require 'spec_helper'

describe "categorysets/new.html.erb" do
  before(:each) do
    assign(:categoryset, stub_model(Categoryset,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new categoryset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categorysets_path, :method => "post" do
      assert_select "input#categoryset_name", :name => "categoryset[name]"
      assert_select "textarea#categoryset_description", :name => "categoryset[description]"
    end
  end
end

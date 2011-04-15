require 'spec_helper'

describe "categorysets/edit.html.erb" do
  before(:each) do
    @categoryset = assign(:categoryset, stub_model(Categoryset,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit categoryset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categorysets_path(@categoryset), :method => "post" do
      assert_select "input#categoryset_name", :name => "categoryset[name]"
      assert_select "textarea#categoryset_description", :name => "categoryset[description]"
    end
  end
end

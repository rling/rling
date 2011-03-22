require 'spec_helper'

describe "pagelets/new.html.erb" do
  before(:each) do
    assign(:pagelet, stub_model(Pagelet,
      :handle => "MyString",
      :display_text => "MyText"
    ).as_new_record)
  end

  it "renders new pagelet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pagelets_path, :method => "post" do
      assert_select "input#pagelet_handle", :name => "pagelet[handle]"
      assert_select "textarea#pagelet_display_text", :name => "pagelet[display_text]"
    end
  end
end

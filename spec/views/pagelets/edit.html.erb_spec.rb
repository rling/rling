require 'spec_helper'

describe "pagelets/edit.html.erb" do
  before(:each) do
    @pagelet = assign(:pagelet, stub_model(Pagelet,
      :handle => "MyString",
      :display_text => "MyText"
    ))
  end

  it "renders the edit pagelet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pagelets_path(@pagelet), :method => "post" do
      assert_select "input#pagelet_handle", :name => "pagelet[handle]"
      assert_select "textarea#pagelet_display_text", :name => "pagelet[display_text]"
    end
  end
end

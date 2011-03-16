require 'spec_helper'

describe "pages/edit.html.erb" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :title => "MyString",
      :body => "MyText",
      :perma_link => "MyString",
      :home_page => false,
      :page_view_type => 1,
      :user_id => 1
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pages_path(@page), :method => "post" do
      assert_select "input#page_title", :name => "page[title]"
      assert_select "textarea#page_body", :name => "page[body]"
      assert_select "input#page_perma_link", :name => "page[perma_link]"
      assert_select "input#page_home_page", :name => "page[home_page]"
      assert_select "input#page_page_view_type", :name => "page[page_view_type]"
      assert_select "input#page_user_id", :name => "page[user_id]"
    end
  end
end

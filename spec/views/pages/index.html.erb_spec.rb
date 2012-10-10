require 'spec_helper'

describe "pages/index.html.erb" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :title => "Title",
        :body => "MyText",
        :perma_link => "Perma Link",
        :home_page => false,
        :page_view_type => 1,
        :user_id => 1
      ),
      stub_model(Page,
        :title => "Title",
        :body => "MyText",
        :perma_link => "Perma Link",
        :home_page => false,
        :page_view_type => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Perma Link".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

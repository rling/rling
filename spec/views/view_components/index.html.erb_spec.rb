require 'spec_helper'

describe "view_components/index.html.erb" do
  before(:each) do
    assign(:view_components, [
      stub_model(ViewComponent,
        :view_id => 1,
        :name => "Name",
        :is_linked => false
      ),
      stub_model(ViewComponent,
        :view_id => 1,
        :name => "Name",
        :is_linked => false
      )
    ])
  end

  it "renders a list of view_components" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

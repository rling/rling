require 'spec_helper'

describe "view_orders/index.html.erb" do
  before(:each) do
    assign(:view_orders, [
      stub_model(ViewOrder,
        :view_id => 1,
        :name => "Name",
        :order => "Order"
      ),
      stub_model(ViewOrder,
        :view_id => 1,
        :name => "Name",
        :order => "Order"
      )
    ])
  end

  it "renders a list of view_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Order".to_s, :count => 2
  end
end

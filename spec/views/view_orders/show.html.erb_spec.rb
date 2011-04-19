require 'spec_helper'

describe "view_orders/show.html.erb" do
  before(:each) do
    @view_order = assign(:view_order, stub_model(ViewOrder,
      :view_id => 1,
      :name => "Name",
      :order => "Order"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Order/)
  end
end

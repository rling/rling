require 'spec_helper'

describe "view_orders/edit.html.erb" do
  before(:each) do
    @view_order = assign(:view_order, stub_model(ViewOrder,
      :view_id => 1,
      :name => "MyString",
      :order => "MyString"
    ))
  end

  it "renders the edit view_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => view_orders_path(@view_order), :method => "post" do
      assert_select "input#view_order_view_id", :name => "view_order[view_id]"
      assert_select "input#view_order_name", :name => "view_order[name]"
      assert_select "input#view_order_order", :name => "view_order[order]"
    end
  end
end

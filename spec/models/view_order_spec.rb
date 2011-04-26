require 'spec_helper'

describe ViewOrder do
  before (:each) do
    @view_attributes={ :perma_link =>'/permalink' ,:title=>'title' }
    @view_order_attributes={:view_id=>'1', :name =>'name' ,:order=>'order'}
    @view_order=ViewOrder.create!( @view_condition_attributes )
    @view=View.create!( @view_attributes)
  end

  it "should create at valid attributes" do
    @view_order.should be_valid
  end

 # ***********************Tests Associations*************************************************#
  it "belongs to a View" do
    view_order=ViewOrder.new
    view_order.view.should be_nil
    view_order.view=@view
    view_order.view .should eql(@view)
  end
end

# == Schema Information
#
# Table name: view_orders
#
#  id         :integer(4)      not null, primary key
#  view_id    :integer(4)
#  name       :string(255)
#  order      :string(255)
#  created_at :datetime
#  updated_at :datetime
#


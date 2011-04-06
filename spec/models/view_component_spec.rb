require 'spec_helper'

describe ViewComponent do
  before (:each) do
  
    @view_attributes ={  :perma_link =>'/permalink' ,:title=>'title' }
    @view=View.create!(@view_attributes)
 end

  it "belongs to a View" do
    @View_component1=ViewComponent.new
    @View_component1.view.should be_nil
    @View_component1.view=@view
    @View_component1.view.should eql(@view)

   end
 
  end

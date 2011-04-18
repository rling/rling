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


# == Schema Information
#
# Table name: view_components
#
#  id           :integer(4)      not null, primary key
#  view_id      :integer(4)
#  name         :string(255)
#  is_linked    :boolean(1)      default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  position     :integer(4)      default(0)
#  display_name :string(255)
#


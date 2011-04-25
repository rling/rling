require 'spec_helper'

describe ViewCondition do
  before (:each) do
  @view_attributes={ :perma_link =>'/permalink' ,:title=>'title' }
  @view_condition_attributes={:view_id=>'1', :name =>'name' ,:value=>'value',:operator=>'op',:relation_with=>"rewt" }

  @view_condition=ViewCondition.create!( @view_condition_attributes )
  @view=View.create!( @view_attributes)
 end

it "should create at valid attributes" do

   @view_condition.should be_valid
 end




 # ***********************Tests Associations*************************************************#
   it "belongs to a View" do
    view_condition=ViewCondition.new
    view_condition.view.should be_nil
    view_condition.view=@view
     view_condition.view .should eql(@view)

   end

  
end

# == Schema Information
#
# Table name: view_conditions
#
#  id            :integer(4)      not null, primary key
#  view_id       :integer(4)
#  name          :string(255)
#  value         :string(255)
#  operator      :string(255)
#  relation_with :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#


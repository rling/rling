require 'spec_helper'

describe ModelSubmission do
  before(:each) do
  @object_model_attributes={ :perma_link_parent =>'/permalink1' ,:name=>'name' }
  @object_model=ObjectModel.create!(@object_model_attributes)
  @model_submission_attributes={:object_model_id=>'1', :perma_link=>'/permalink2' }
  @model_submission=ModelSubmission.create!(@model_submission_attributes)
  @model_data_attributes={:model_component_id=>1,:model_submission_id=>1,:data_value=>'value'}
end

it "should not be valid without a perma link" do
   model_submission=ModelSubmission.new(@model_submission_attributes.merge(:perma_link=>nil))
   model_submission.should_not be_valid
   model_submission=ModelSubmission.new(@model_submission_attributes.merge(:perma_link=>''))
   model_submission.should_not be_valid
 end
  it "should have a unique perma link" do
   model_submission=ModelSubmission.new(@model_submission_attributes.merge(:object_model_id=>'2'))
   model_submission.should_not be_valid
 end

  it "belongs to a object model" do
    @model_submission2=ModelSubmission.new
    @model_submission2.object_model.should be_nil
    @model_submission2.object_model=@object_model
    @model_submission2.object_model .should eql(@object_model)
  end
  it "should test default page view type value" do
     @model_submission.page_view_type.should eql(0)
  end



   it "should have many model datas" do

   @model_data1=ModelData.create!( @model_data_attributes.merge(:model_submission_id=>@model_submission.id))
   @model_data2=ModelData.create!( @model_data_attributes.merge(:model_submission_id=>@model_submission.id))
   @model_submission.should have(2).model_datas
  end


  it "testing the association of model datas" do
    ModelSubmission.reflect_on_association(:model_datas).should_not  be_nil
  end

  it "should destroy associated model data" do
    @model_data=ModelData.create!( @model_data_attributes.merge(:model_submission_id=>@model_submission.id))
    @model_submission.destroy
    ModelData.find_by_id(@model_data.id).should be_nil
  end

  it "has many categorizations" do
    @model_submission.categorizations<< Categorization.new(:model_submission_id=>@model_submission.id)
    @model_submission.categorizations<< Categorization.new(:model_submission_id=>@model_submission.id)
    @model_submission.should have(2).categorizations
  end

  it "should destroy associated categorizations" do
    @model_submission.destroy
    Categorization.find_by_model_submission_id(@model_submission.id).should be_nil
  end

  it "has many categories through categorizations" do
    @category = Category.new(:name => 'name')
    @model_submission.categorizations<< Categorization.new(:category_id=>@category.id)
    @model_submission.categorizations<< Categorization.new(:category_id=>@category.id)
    @model_submission.should have(2).categorizations
  end
end


# == Schema Information
#
# Table name: model_submissions
#
#  id              :integer(4)      not null, primary key
#  object_model_id :integer(4)
#  perma_link      :string(255)
#  home_page       :boolean(1)
#  page_view_type  :integer(4)      default(0)
#  created_at      :datetime
#  updated_at      :datetime
#  creator_id      :integer(4)
#  updater_id      :integer(4)
#  status          :string(255)
#


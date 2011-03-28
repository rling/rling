require 'spec_helper'

describe ObjectModel do
   before (:each) do
  @object_model_attributes={ :perma_link_parent =>'/permalink' ,:name=>'name' }
  @modelcomponent_attributes={:object_model_id=>'1', :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
  @object_model=ObjectModel.create!(@object_model_attributes)
  @model_submission_attributes={:object_model_id=>'1', :perma_link=>'/perma_link2' }
 end
 it "should create at valid attributes" do

     @object_model.should be_valid
 end


 #*************************************Tests Validations********************************************************#

  it "should not be valid without a name" do
   object_model=ObjectModel.new(@object_model_attributes.merge(:name=>nil,:perma_link_parent=>'/perma_link2'))
   object_model.should_not be_valid

   object_model=ObjectModel.new(@object_model_attributes.merge(:name=>' ',:perma_link_parent=>'/perma_link3'))
   object_model.should_not be_valid
  end
  
  it "should not be valid without a perma link parent" do
   object_model=ObjectModel.new(@object_model_attributes.merge(:name=>'name2',:perma_link_parent=>nil))
   object_model.should_not be_valid

   object_model=ObjectModel.new(@object_model_attributes.merge(:name=>'name3 ',:perma_link_parent=>''))
   object_model.should_not be_valid

  end
  it "should have a unique name" do

   object_model=ObjectModel.new(@object_model_attributes.merge(:perma_link_parent=>'/perma_link1'))
   object_model.should_not be_valid

  end
  it "should have a unique perma link parent" do

   object_model=ObjectModel.new(@object_model_attributes.merge(:name=>'name1'))
   object_model.should_not be_valid

  end
   it "should have many model component" do

   @model_component1=ModelComponent.create!( @modelcomponent_attributes.merge(:object_model_id=>@object_model.id))
   @model_component2=ModelComponent.create!( @modelcomponent_attributes.merge(:object_model_id=>@object_model.id,:component_name=>'name2'))
   @object_model.should have(2).model_components
  end
  
  it "should destroy associated model components" do
  @model_component1=ModelComponent.create!( @modelcomponent_attributes.merge(:object_model_id=>@object_model.id))
  @object_model.destroy
  ModelComponent.find_by_id(@model_component1.id).should be_nil
 end



  it "should have many model submissions" do

   @model_submission1=ModelSubmission.create!( @model_submission_attributes.merge(:object_model_id=>@object_model.id))
   @model_submission2=ModelSubmission.create!( @model_submission_attributes.merge(:object_model_id=>@object_model.id,:perma_link=>'/perma_link3'))
   @object_model.should have(2).model_submissions
  end


   it "should destroy associated model submissions" do
   @model_submission1=ModelSubmission.create!( @model_submission_attributes.merge(:object_model_id=>@object_model.id))
  @object_model.destroy
  ModelSubmission.find_by_id(@model_submission1.id).should be_nil
 end

end

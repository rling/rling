require 'spec_helper'

describe ModelComponent do
  before (:each) do
   @object_model_attributes={ :perma_link_parent =>'/perma_link1' ,:name=>'name' }
   @object_model=ObjectModel.create!(@object_model_attributes)
   @modelcomponent_attributes={:object_model_id=>'1', :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
   @model_component=ModelComponent.create!( @modelcomponent_attributes )
   @model_data_attributes={:model_component_id=>@model_component.id}
 end

it "should create at valid attributes" do

     @model_component.should be_valid
 end


 #*************************************Tests Validations********************************************************#

  it "should not be valid without a component name" do
   model_component=ModelComponent.new(@modelcomponent_attributes.merge(:component_name=>nil))
   model_component.should_not be_valid

   model_component=ModelComponent.new(@modelcomponent_attributes.merge(:component_name=>' '))
   model_component.should_not be_valid
  end
  it "should not be valid without a component display name" do
   model_component=ModelComponent.new(@modelcomponent_attributes.merge(:component_display_name=>nil,:component_name=>'name1'))
   model_component.should_not be_valid

   model_component=ModelComponent.new(@modelcomponent_attributes.merge(:component_display_name=>'',:component_name=>'name2'))
   model_component.should_not be_valid
  end

  it "should not be valid without a component type" do
 model_component=ModelComponent.new(@modelcomponent_attributes.merge(:component_type=>nil,:component_name=>'name1'))
   model_component.should_not be_valid

   model_component=ModelComponent.new(@modelcomponent_attributes.merge(:component_type=>'',:component_name=>'name2'))
   model_component.should_not be_valid

  end
  it "should have a unique component name " do
   model_component=ModelComponent.new(@modelcomponent_attributes.merge(:object_model_id=>'2', :component_name =>'name' ,:component_type=>'type2',:component_display_name=>'dname1'))
   model_component.should_not be_valid
  end
   it "should have a minimum length 3 for component name " do
   model_component=ModelComponent.new(@modelcomponent_attributes.merge( :component_name =>'ab' ,:object_model_id=>'2' ,:component_type=>'type2',:component_display_name=>'dname1'))
   model_component.should_not be_valid
  end

  #*************************************Default value******************************************************#
   it "should test is_deletable dfault value " do
     @model_component.is_deletable.should eql(true)
   end

  it "should test is_mandatory dfault value " do
     @model_component.is_mandatory.should eql(false)
   end


  #************************************Tests Associations*************************************************#
   it "belongs to a object model" do
    @model_component2=ModelComponent.new
    @model_component2.object_model.should be_nil
    @model_component2.object_model=@object_model
    @model_component2.object_model .should eql(@object_model)

   end


   it "should have many model datas" do

   @model_data1=ModelData.create!( @model_data_attributes.merge(:model_component_id=>@model_component.id))
   @model_data2=ModelData.create!( @model_data_attributes.merge(:model_component_id=>@model_component.id))
   @model_component.should have(2).model_datas
  end


  it "testing the association of model datas" do
  ModelComponent.reflect_on_association(:model_datas).should_not  be_nil
  end

  it "should destroy associated model data" do

    @model_data=ModelData.create!( @model_data_attributes.merge(:model_component_id=>@model_component.id))
    @model_component.destroy
    ModelData.find_by_id(@model_data.id).should be_nil
   end

 

end


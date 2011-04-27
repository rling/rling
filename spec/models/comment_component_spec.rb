require 'spec_helper'

describe CommentComponent do
  before (:each) do
    @object_model_attributes={ :perma_link_parent =>'/permalink1' ,:name=>'name' }
    @object_model=ObjectModel.create!(@object_model_attributes)
    @commentcomponent_attributes={:object_model_id=>'1', :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
    @comment_component=CommentComponent.create!( @commentcomponent_attributes )
    @comment_data_attributes={:comment_component_id=>@comment_component.id}
  end

  it "should create at valid attributes" do
    @comment_component.should be_valid
  end

 #*************************************Tests Validations********************************************************#

  it "should not be valid without a component name" do
    comment_component=CommentComponent.new(@commentcomponent_attributes.merge(:component_name=>nil))
    comment_component.should_not be_valid

    comment_component=CommentComponent.new(@commentcomponent_attributes.merge(:component_name=>''))
    comment_component.should_not be_valid
  end

  it "should not be valid without a component display name" do
    comment_component=CommentComponent.new(@commentcomponent_attributes.merge(:component_display_name=>nil))
    comment_component.should_not be_valid

    comment_component=CommentComponent.new(@commentcomponent_attributes.merge(:component_display_name=>' '))
    comment_component.should_not be_valid
  end

  it "should not be valid without a component type" do
    comment_component=CommentComponent.new(@commentcomponent_attributes.merge(:component_type=>nil))
    comment_component.should_not be_valid
    comment_component=CommentComponent.new(@commentcomponent_attributes.merge(:component_type=>' '))
    comment_component.should_not be_valid
  end

  it "should have a minimum length 3 for component name " do
    comment_component=CommentComponent.new(@commentcomponent_attributes.merge( :component_name =>'ab' ))
    comment_component.should_not be_valid
  end

  #*************************************Default value******************************************************#
   
  it "should test is_mandatory dfault value " do
    @comment_component.mandatory.should eql(false)
  end

  #***********************************Tests Associations*************************************************#
  it "belongs to a object model" do
    @comment_component2=CommentComponent.new
    @comment_component2.object_model.should be_nil
    @comment_component2.object_model=@object_model
    @comment_component2.object_model .should eql(@object_model)
  end

  it "should have many comment datas" do
    @comment_data1=CommentDatum.create!( @comment_data_attributes.merge(:comment_component_id=>@comment_component.id))
    @comment_data2=CommentDatum.create!( @comment_data_attributes.merge(:comment_component_id=>@comment_component.id))
    @comment_component.should have(2).comment_data
  end

  it "testing the association of model datas" do
    CommentComponent.reflect_on_association(:comment_data).should_not  be_nil
  end

  it "should destroy associated model data" do
    @comment_data=CommentDatum.create!( @comment_data_attributes.merge(:comment_component_id=>@comment_component.id))
    @comment_component.destroy
    CommentDatum.find_by_id(@comment_data.id).should be_nil
  end
end

# == Schema Information
#
# Table name: comment_components
#
#  id                     :integer(4)      not null, primary key
#  object_model_id        :integer(4)
#  component_name         :string(255)
#  component_display_name :string(255)
#  component_type         :string(255)
#  component_values       :text
#  default_value          :string(255)
#  mandatory              :boolean(1)      default(FALSE)
#  position               :integer(4)      default(0)
#  created_at             :datetime
#  updated_at             :datetime
#


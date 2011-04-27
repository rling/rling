require 'spec_helper'

describe ObjectModel do
  before (:each) do
    @object_model_attributes={ :perma_link_parent =>'/permalink' ,:name=>'name' }
    @modelcomponent_attributes={:object_model_id=>'1', :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
    @object_model=ObjectModel.create!(@object_model_attributes)
    @model_submission_attributes={:object_model_id=>'1', :perma_link=>'/permalink2' }
    @comment_component_attributes={:object_model_id=>@object_model.id,:component_name=>'name1',:component_display_name=>'Name 1',:component_type=>'Textarea'}
  end

  it "should create at valid attributes" do
    @object_model.should be_valid
  end

 #*************************************Tests Validations********************************************************#
  it "should not be valid without a name" do
    object_model=ObjectModel.new(@object_model_attributes.merge(:name=>nil,:perma_link_parent=>'/permalink2'))
    object_model.should_not be_valid

    object_model=ObjectModel.new(@object_model_attributes.merge(:name=>' ',:perma_link_parent=>'/permalink3'))
    object_model.should_not be_valid
  end
  
  it "should not be valid without a perma link parent" do
    object_model=ObjectModel.new(@object_model_attributes.merge(:name=>'name2',:perma_link_parent=>nil))
    object_model.should_not be_valid

    object_model=ObjectModel.new(@object_model_attributes.merge(:name=>'name3 ',:perma_link_parent=>''))
    object_model.should_not be_valid
  end

  it "should have a unique name" do
    object_model=ObjectModel.new(@object_model_attributes.merge(:perma_link_parent=>'/permalink1'))
    object_model.should_not be_valid
  end

  it "should have a unique perma link parent" do
    object_model=ObjectModel.new(@object_model_attributes.merge(:name=>'name1'))
    object_model.should_not be_valid
  end
  
  it "should have many model components" do
    @model_component1=ModelComponent.create!( @modelcomponent_attributes.merge(:object_model_id=>@object_model.id))
    @model_component2=ModelComponent.create!( @modelcomponent_attributes.merge(:object_model_id=>@object_model.id,:component_name=>'name2'))
    @object_model.should have(4).model_components
  end
  
  it "should destroy associated model components" do
    @model_component1=ModelComponent.create!( @modelcomponent_attributes.merge(:object_model_id=>@object_model.id))
    @object_model.destroy
    ModelComponent.find_by_id(@model_component1.id).should be_nil
  end

  it "should have many model submissions" do
    @model_submission1=ModelSubmission.create!( @model_submission_attributes)
    @model_submission2=ModelSubmission.create!( @model_submission_attributes.merge(:perma_link=>'/permalink3'))
    @object_model.model_submissions << @model_submission1
    @object_model.model_submissions << @model_submission2
    @object_model.save
    @object_model.should have(2).model_submissions
  end

  it "should destroy associated model submissions" do
    @model_submission1=ModelSubmission.create!( @model_submission_attributes)
    @object_model.model_submissions << @model_submission1
    @object_model.save
    @object_model.destroy
    ModelSubmission.find_by_id(@model_submission1.id).should be_nil
  end

  it "should have many comment components" do
    comment_component1=CommentComponent.create!(@comment_component_attributes)
    comment_component2=CommentComponent.create!(@comment_component_attributes.merge(:component_name=>'name2',:component_display_name=>'Name2'))
    @object_model.comment_components << comment_component1
    @object_model.comment_components << comment_component2
    @object_model.save
    @object_model.should have(2).comment_components
  end

  it "should destroy associated comment components" do
    comment_component1=CommentComponent.create!(@comment_component_attributes)
    @object_model.comment_components << comment_component1
    @object_model.destroy
    CommentComponent.find_by_id(comment_component1.id).should be_nil
  end

  it "should belong to categoryset" do
    @object_model.categoryset.should be_nil
    @object_model.categoryset = @categoryset
    @object_model.categoryset.should eql(@categoryset)
  end

  it "should have one  mailer "do
    first_mailer=Mailer.create!(:handle=>'first',:subject=>'first mail',:body=>'this is first mail',:object_model_id=>@object_model.id)
    second_mailer=Mailer.create!(:handle=>'second',:subject=>'second mail',:body=>'this is second mail',:object_model_id=>@object_model.id)
    @object_model.mailer.should eql(first_mailer)
    @object_model.mailer.should_not eql(second_mailer)
  end

  it "should destroy associated mailer" do
    mailer=Mailer.create!(:handle=>'first',:subject=>'first mail',:body=>'this is first mail',:object_model_id=>@object_model.id)
    @object_model.destroy
    Mailer.find_by_id(mailer.id).should be_nil
  end
end


# == Schema Information
#
# Table name: object_models
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  perma_link_parent    :string(255)
#  description          :text
#  created_at           :datetime
#  updated_at           :datetime
#  comment_component_id :integer(4)
#  allow_comments       :boolean(1)      default(FALSE)
#  is_comment_recursive :boolean(1)      default(FALSE)
#  email_on_comment     :boolean(1)      default(FALSE)
#  layout               :string(255)
#  categoryset_id       :integer(4)
#


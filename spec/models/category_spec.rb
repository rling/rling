require 'spec_helper'

describe Category do
  before(:each) do
    @model_submission = ModelSubmission.create!(:object_model_id=>'1',:perma_link=>'test')
    @category = Category.new(:name => 'name')
  end

#test for default value...................................

  it "should have default value for position" do
    @category.position.should == 0
  end

  it "should have default value for level" do
    @category.level.should == 0
  end

  it "should have default value for parent_id" do
    @category.parent_id.should == 0
  end

#test for validation................................................

  it "should contain a name" do
    category = Category.new(:name => nil)
    category.should_not be_valid
  end

  it "test for before_save" do
      category = Category.new(:name=>'test', :categoryset_id=>1)
      category.should_receive(:set_level)
      category.save
  end

  it "test for before_destroy" do
      @category.should_receive(:set_children)
      @category.destroy
  end

#test for belongs_to........................................

  it "should belongs to categoryset" do
    @category.categoryset.should be_nil
    @category.categoryset=@categoryset
    @category.categoryset.should eql(@categoryset)
  end

  it "has many categorizations" do
    @category.categorizations<< Categorization.new(:category_id=>@category.id)
    @category.categorizations<< Categorization.new(:category_id=>@category.id)
    @category.should have(2).categorizations
  end

  it "has many model submissions through categorizations" do
    @category.categorizations<< Categorization.new(:model_submission_id=>@model_submission.id)
    @category.categorizations<< Categorization.new(:model_submission_id=>@model_submission.id)
    @category.should have(2).categorizations
  end

  it "should destroy associated categorizations" do
    @category.destroy
    Categorization.find_by_category_id(@category.id).should be_nil
  end
end

# == Schema Information
#
# Table name: categories
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  description    :text
#  categoryset_id :integer(4)
#  parent_id      :integer(4)      default(0)
#  level          :integer(4)      default(0)
#  position       :integer(4)      default(0)
#  created_at     :datetime
#  updated_at     :datetime
#


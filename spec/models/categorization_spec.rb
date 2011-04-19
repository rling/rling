require 'spec_helper'

describe Categorization do
  before(:each) do
    @category = Category.create!(:name=>'nature')
    @model_submission = ModelSubmission.create!(:object_model_id=>'1',:perma_link=>'test')
    @categorization = Categorization.new()
  end

  it "should belong to category" do
    @categorization.category.should be_nil
    @categorization.category=@category
    @categorization.category.should eql(@category)
  end

  it "should belong to model submission" do
    @categorization.model_submission.should be_nil
    @categorization.model_submission=@model_submission
    @categorization.model_submission.should eql(@model_submission)
  end
end

# == Schema Information
#
# Table name: categorizations
#
#  id                  :integer(4)      not null, primary key
#  model_submission_id :integer(4)
#  category_id         :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#


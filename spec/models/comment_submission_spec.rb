require 'spec_helper'

describe CommentSubmission do
   before(:each) do
  @object_model_attributes={ :perma_link_parent =>'/permalink' ,:name=>'name',:allow_comments=>true}
  @object_model = ObjectModel.create!(@object_model_attributes)
  @model_submission_attributes={:object_model_id=>@object_model.id, :perma_link=>'/permalink2' }
  @model_submission=ModelSubmission.create!(@model_submission_attributes)
  @comment_submission_attributes={:model_submission_id=>@model_submission.id }
  @comment_submission=CommentSubmission.create!(@comment_submission_attributes)
  @comment_data_attributes={:comment_component_id=>1,:comment_submission_id=>@comment_submission.id,:data_value=>'value'}
end



  it "belongs to a  model submission" do
    @comment_submission2=CommentSubmission.new
    @comment_submission2.model_submission.should be_nil
    @comment_submission2.model_submission=@model_submission
    @comment_submission2.model_submission .should eql(@model_submission)
  end
  



   it "should have many comment datas" do

   @comment_data1=CommentData.create!( @comment_data_attributes.merge(:comment_submission_id=>@comment_submission.id))
   @comment_data2=CommentData.create!( @comment_data_attributes.merge(:comment_submission_id=>@comment_submission.id))
   @comment_submission.should have(2).comment_datas
  end


  it "testing the association of comment datas" do
  CommentSubmission.reflect_on_association(:comment_datas).should_not  be_nil
  end

  it "should destroy associated comment data" do

    @comment_data=CommentData.create!( @comment_data_attributes.merge(:comment_submission_id=>@comment_submission.id))
    @comment_submission.destroy
    CommentData.find_by_id(@comment_data.id).should be_nil
   end


end

# == Schema Information
#
# Table name: comment_submissions
#
#  id                  :integer(4)      not null, primary key
#  model_submission_id :integer(4)
#  parent_id           :integer(4)
#  creator_id          :integer(4)
#  updater_id          :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  level               :integer(4)      default(0)
#


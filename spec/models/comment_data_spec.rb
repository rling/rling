require 'spec_helper'

describe CommentData do
 before(:each) do
  @comment_submission_attributes={:model_submission_id=>'1' }
  @comment_submission=CommentSubmission.create!(@comment_submission_attributes)
  @commentcomponent_attributes={:object_model_id=>'1', :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
  @comment_component=CommentComponent.create!( @commentcomponent_attributes )
end

   it "belongs to a comment submission" do
   @comment_data1=CommentData.new
   @comment_data1.comment_submission.should be_nil
   @comment_data1.comment_submission=@comment_submission
   @comment_data1.comment_submission.should eql(@comment_submission)
 end
  it "belongs to a coment component" do
   @comment_data1=CommentData.new
   @comment_data1.comment_component.should be_nil
   @comment_data1.comment_component=@comment_component
   @comment_data1.comment_component.should eql(@comment_component)
 end
end

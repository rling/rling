require 'spec_helper'

describe CommentData do
 before(:each) do
 @object_model_attributes={ :perma_link_parent =>'/permalink' ,:name=>'name',:allow_comments=>true}
  @object_model = ObjectModel.create!(@object_model_attributes)
  @model_submission_attributes={:object_model_id=>@object_model.id, :perma_link=>'/permalink2' }
  @model_submission=ModelSubmission.create!(@model_submission_attributes)
  @comment_submission_attributes={:model_submission_id=>@model_submission.id }
  @comment_submission=CommentSubmission.create!(@comment_submission_attributes)
  @commentcomponent_attributes={:object_model_id=>@object_model.id, :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
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

# == Schema Information
#
# Table name: comment_data
#
#  id                    :integer(4)      not null, primary key
#  comment_component_id  :integer(4)
#  comment_submission_id :integer(4)
#  data_value            :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#


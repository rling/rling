require 'spec_helper'

describe ModelData do
 before(:each) do
  @model_submission_attributes={:object_model_id=>'1', :perma_link=>'/permalink2' }
  @model_submission=ModelSubmission.create!(@model_submission_attributes)
  @modelcomponent_attributes={:object_model_id=>'1', :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
  @model_component=ModelComponent.create!( @modelcomponent_attributes )
end

   it "belongs to a model submission" do
   @model_data1=ModelData.new
   @model_data1.model_submission.should be_nil
   @model_data1.model_submission=@model_submission
   @model_data1.model_submission.should eql(@model_submission)
 end
  it "belongs to a form component" do
   @model_data1=ModelData.new
   @model_data1.model_component.should be_nil
   @model_data1.model_component=@model_component
   @model_data1.model_component.should eql(@model_component)
 end
end

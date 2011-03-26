require 'spec_helper'

describe FormData do
 before (:each) do
  @formcomponent_attributes={:object_form_id=>'1', :component_name =>'name' ,:component_type=>'type' }
  @formsubmission_attributes={:object_form_id=>'1' }
  @form_component=FormComponent.create!( @formcomponent_attributes )
  @form_submission=SubmissionForm.create!( @formsubmission_attributes )
 end
  it "belongs to a submission form" do
   @form_data1=FormData.new
   @form_data1.submission_form.should be_nil
   @form_data1.submission_form=@form_submission
   @form_data1.submission_form.should eql(@form_submission)
 end
  it "belongs to a form component" do
   @form_data1=FormData.new
   @form_data1.form_component.should be_nil
   @form_data1.form_component=@form_component
   @form_data1.form_component.should eql(@form_component)
 end
end

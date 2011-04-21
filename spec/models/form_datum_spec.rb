require 'spec_helper'

describe FormDatum do
 before (:each) do
  @formcomponent_attributes={:object_form_id=>'1', :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
  @formsubmission_attributes={:object_form_id=>'1' }
  @form_component=FormComponent.create!( @formcomponent_attributes )
  @form_submission=FormSubmission.create!( @formsubmission_attributes )
 end
  it "belongs to a submission form" do
   @form_data1=FormDatum.new
   @form_data1.form_submission.should be_nil
   @form_data1.form_submission=@form_submission
   @form_data1.form_submission.should eql(@form_submission)
 end
  it "belongs to a form component" do
   @form_data1=FormDatum.new
   @form_data1.form_component.should be_nil
   @form_data1.form_component=@form_component
   @form_data1.form_component.should eql(@form_component)
 end
end

# == Schema Information
#
# Table name: form_data
#
#  id                 :integer(4)      not null, primary key
#  form_component_id  :integer(4)
#  data_value         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  form_submission_id :integer(4)
#


require 'spec_helper'

describe FormSubmission do



 before (:each) do
  @object_form_attributes={ :perma_link =>'/permalink' ,:title=>'title' }
  @formsubmission_attributes={:object_form_id=>'1' }
  @formcomponent_attributes={:object_form_id=>'1', :component_name =>'name' ,:component_type=>'type' ,:component_display_name=>"dname"}
  @form_data_attributes={ :form_component_id=>'1',:form_submission_id=>'1'}
  @form_submission=FormSubmission.create!( @formsubmission_attributes )
  @form_component=FormComponent.create!( @formcomponent_attributes )
  @form_data=FormDatum.create!( @form_data_attributes )
  @object_form=ObjectForm.create!( @object_form_attributes)
 end

  it "belongs to a object form" do
    @form_submission2=FormSubmission.new
    @form_submission2.object_form.should be_nil
    @form_submission2.object_form=@object_form
    @form_submission2.object_form .should eql(@object_form)

 end

   it "should have many form_datas" do

   @form_data1=FormDatum.create!( @form_data_attributes.merge(:form_submission_id=>@form_submission.id))
   @form_data2=FormDatum.create!( @form_data_attributes.merge(:form_submission_id=>@form_submission.id))
   @form_submission.should have(2).form_data
  end


  it "testing the association ofpage variable" do
  FormSubmission.reflect_on_association(:form_data).should_not  be_nil
  end

  it "should destroy associated form data" do

    @form_data1=FormDatum.create!( @form_data_attributes.merge(:form_submission_id=>@form_submission.id))
    FormDatum.find_by_id(@form_data1.id).should_not be_nil
    @form_submission.destroy
    FormDatum.find_by_id(@form_data1.id).should be_nil
   end

  #*******************Tests instance methods ***************************#
    it "should test emailable format method " do

     @form_component1=FormComponent.create!(@formcomponent_attributes.merge(:object_form_id=>'2', :component_name =>'name2' ,:component_type=>'Textfield'))
     @form_data1=FormDatum.create!( @form_data_attributes.merge(:form_submission_id=> @form_submission.id, :form_component_id => @form_component1.id ,:data_value=>'value'))
     @form_submission.emailable_format.should eql("name2 :- value \n")


     @form_component2=FormComponent.create!(@formcomponent_attributes.merge(:object_form_id=>'2', :component_name =>'name3' ,:component_type=>'File'))
      @form_submission1=FormSubmission.create!( @formsubmission_attributes )
     @form_data2=FormDatum.create!( @form_data_attributes.merge(:form_submission_id=> @form_submission1.id, :form_component_id => @form_component2.id ,:data_value=>'value'))
     @form_submission1.emailable_format.should eql("name3 :- FILEUPLOADED \n")

     @form_component3=FormComponent.create!(@formcomponent_attributes.merge(:object_form_id=>'2', :component_name =>'name4' ,:component_type=>'Checkbox'))
      @form_submission2=FormSubmission.create!( @formsubmission_attributes )
     @form_data3=FormDatum.create!( @form_data_attributes.merge(:form_submission_id=> @form_submission2.id, :form_component_id => @form_component3.id ,:data_value=>'1'))
     @form_submission2.emailable_format.should eql("name4 :- Yes\n")

    end

end

# == Schema Information
#
# Table name: form_submissions
#
#  id             :integer(4)      not null, primary key
#  object_form_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#


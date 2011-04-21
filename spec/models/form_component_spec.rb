require 'spec_helper'

describe FormComponent do
 before (:each) do
  @object_form_attributes={ :perma_link =>'/permalink' ,:title=>'title' }
  @formcomponent_attributes={:object_form_id=>'1', :component_name =>'name' ,:component_type=>'type',:component_display_name=>'dname' }
  @form_data_attributes={ :form_component_id=>'1',:form_submission_id=>'1'}
  @form_component=FormComponent.create!( @formcomponent_attributes )
  @form_data=FormDatum.create!( @form_data_attributes )
  @object_form=ObjectForm.create!( @object_form_attributes)
 end

it "should create at valid attributes" do

     @form_component.should be_valid
 end


 #*************************************Tests Validations********************************************************#

  it "should not be valid without a component name" do
   form_component=FormComponent.new(@formcomponent_attributes.merge(:component_name=>nil))
   form_component.should_not be_valid

   form_component=FormComponent.new(@formcomponent_attributes.merge(:component_name=>nil))
   form_component.should_not be_valid
  end
  it "should not be valid without a component display name" do
   form_component=FormComponent.new(@formcomponent_attributes.merge(:component_display_name=>nil,:component_name=>'name1'))
   form_component.should_not be_valid

   form_component=FormComponent.new(@formcomponent_attributes.merge(:component_display_name=>nil,:component_name=>'name2'))
   form_component.should_not be_valid
  end

  it "should not be valid without a component type" do
   form_component=FormComponent.new(@formcomponent_attributes.merge(:component_type=>nil,:component_name=>'name2'))
   form_component.should_not be_valid

   form_component=FormComponent.new(@formcomponent_attributes.merge(:component_type=>nil,:component_name=>'name3'))
   form_component.should_not be_valid

  end
 
   it "should have a minimum length 3 for component name " do
   form_component=FormComponent.new(@formcomponent_attributes.merge( :component_name =>'ab' ))
   form_component.should_not be_valid
  end


  #*******************************************************************************************************#
  it "should test is_mandatory dfault value " do
     @form_component.mandatory.should eql(false)
  end
  #************************************Tests Associations*************************************************#
   it "belongs to a object form" do
    @form_component2=FormComponent.new
    @form_component2.object_form.should be_nil
    @form_component2.object_form=@object_form
    @form_component2.object_form .should eql(@object_form)

   end

   it "should have many form_datas" do
 
   @form_data1=FormDatum.create!( @form_data_attributes.merge(:form_component_id=>@form_component.id))
   @form_data2=FormDatum.create!( @form_data_attributes.merge(:form_component_id=>@form_component.id))
   @form_component.should have(2).form_data
  end


  it "testing the association ofpage variable" do
  FormComponent.reflect_on_association(:form_data).should_not  be_nil
  end

  it "should destroy associated form data" do

    @form_data1=FormDatum.create!( @form_data_attributes.merge(:form_component_id=>@form_component.id))
    FormDatum.find_by_id(@form_data1.id).should_not be_nil
    @form_component.destroy
    FormDatum.find_by_id(@form_data1.id).should be_nil
   end

end
# == Schema Information
#
# Table name: form_components
#
#  id                     :integer(4)      not null, primary key
#  object_form_id         :integer(4)
#  component_name         :string(255)
#  component_type         :string(255)
#  component_values       :text
#  default_value          :string(255)
#  mandatory              :boolean(1)      default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#  component_display_name :string(255)
#  position               :integer(4)      default(0)
#


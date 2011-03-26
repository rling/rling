require 'spec_helper'

describe FormComponent do
 before (:each) do
  @object_form_attributes={ :perma_link =>'/permalink' ,:title=>'title' }
  @formcomponent_attributes={:object_form_id=>'1', :component_name =>'name' ,:component_type=>'type' }
  @form_data_attributes={ :form_component_id=>'1',:submission_form_id=>'1'}
  @form_component=FormComponent.create!( @formcomponent_attributes )
  @form_data=FormData.create!( @form_data_attributes )
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

  it "should not be valid without a component type" do
   form_component=FormComponent.new(@formcomponent_attributes.merge(:component_type=>nil))
   form_component.should_not be_valid

   form_component=FormComponent.new(@formcomponent_attributes.merge(:component_type=>nil))
   form_component.should_not be_valid

  end
  it "should have a unique component name " do
   form_component=FormComponent.new(@formcomponent_attributes.merge(:object_form_id=>'2', :component_name =>'name' ,:component_type=>'type2'))
   form_component.should_not be_valid
  end
   it "should have a minimum length 3 for component name " do
   form_component=FormComponent.new(@formcomponent_attributes.merge( :component_name =>'ab' ))
   form_component.should_not be_valid
  end
  #************************************Tests Associations*************************************************#
   it "belongs to a object form" do
    @form_component2=FormComponent.new
    @form_component2.object_form.should be_nil
    @form_component2.object_form=@object_form
    @form_component2.object_form .should eql(@object_form)

   end

   it "should have many form_datas" do
 
   @form_data1=FormData.create!( @form_data_attributes.merge(:form_component_id=>@form_component.id))
   @form_data2=FormData.create!( @form_data_attributes.merge(:form_component_id=>@form_component.id))
   @form_component.should have(2).form_datas
  end


  it "testing the association ofpage variable" do
  FormComponent.reflect_on_association(:form_datas).should_not  be_nil
  end

  it "should destroy associated form data" do

    @form_data1=FormData.create!( @form_data_attributes.merge(:form_component_id=>@form_component.id))
    FormData.find_by_id(@form_data1.id).should_not be_nil
    @form_component.destroy
    FormData.find_by_id(@form_data1.id).should be_nil
   end

end
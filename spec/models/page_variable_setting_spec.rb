require 'spec_helper'

describe PageVariableSetting do
  before (:each) do

   @page_variable_setting_attributes={ :name => 'keyword'}
   @page_variable_setting=PageVariableSetting.create!(@page_variable_setting_attributes)
   @page_variable=PageVariable.create :page_variable_setting_id => @page_variable_setting.id
 end
#********************************Tests Validatitons************************************************#
 it "should  not be valid without a name"        do
   page_variable_setting=PageVariableSetting.new(@page_variable_setting_attributes.merge(:name=>nil))
   page_variable_setting.should_not be_valid 
 
   page_variable_setting=PageVariableSetting.new(@page_variable_setting_attributes.merge(:name=>''))
   page_variable_setting.should_not be_valid 

  end
   
 it "should create unique name" do
   page_variable_setting=PageVariableSetting.new(@page_variable_setting_attributes)
   page_variable_setting.should_not be_valid 
  end
 
 #*******************************Tests Association***********************************************#
  it "should have many page variables" do
    pvs=PageVariableSetting.create!(@page_variable_setting_attributes.merge(:name=> 'description'))
    pvs.page_variables << PageVariable.new(:page_variable_setting_id => pvs.id)
    pvs.page_variables << PageVariable.new(:page_variable_setting_id => pvs.id)
    pvs.should have(2).page_variables

  end
  it "should destroy associated page variable" do
     @page_variable_setting.destroy
     PageVariable.find_by_id(@page_variable.id).should be_nil
  end
end
 #*****************************************END******************************************************#


# == Schema Information
#
# Table name: page_variable_settings
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  default_value :text
#  created_at    :datetime
#  updated_at    :datetime
#


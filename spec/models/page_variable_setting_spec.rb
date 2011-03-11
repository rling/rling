require 'spec_helper'

describe PageVariableSetting do
  before (:each) do
   @pagevarsetting=PageVariableSetting.create :name => 'keyword'
   @pagevariable=PageVariable.create :page_variable_setting_id => @pagevarsetting.id
 end

 it "should  not be valid without a name"        do
  
   @pagevarsetting.name=nil
   @pagevarsetting.should_not be_valid
  end
   
 
 

  it "should create one name" do
   page = PageVariableSetting.new(:name =>'keyword')
   page.should_not be_valid
  end

  it "should have many page variables" do
    pvs=PageVariableSetting.create :name=> 'description'
    pvs.page_variables << PageVariable.new(:page_variable_setting_id => pvs.id)
    pvs.page_variables << PageVariable.new(:page_variable_setting_id => pvs.id)
    pvs.should have(2).page_variables

  end
  it "should destroy associated page variable" do
     @pagevarsetting.destroy
     PageVariable.find_by_id(@pagevariable.id).should be_nil
  end

end

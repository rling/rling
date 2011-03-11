require 'spec_helper'

describe PageVariable do
 before(:each) do 
  @page_attributes={ :perma_link =>'/perma_link' ,:title=>'title' }
  @page=Page.create!(@page_attributes)
  @pagevariablesetting=PageVariableSetting.create :name=>'keyword'
 end
#**************************Belongs to associations*****************************************************#
 it "belongs to a page" do
    @pagevariable=PageVariable.new 
    @pagevariable.page.should be_nil
    @pagevariable.page=@page
    @pagevariable.page .should eql(@page)
   
 end

   it "belongs to a page variable setting" do
    @pagevariable=PageVariable.new 
    @pagevariable.page_variable_setting.should be_nil
    @pagevariable.page_variable_setting=@pagevariablesetting
    @pagevariable.page_variable_setting.should eql(@pagevariablesetting)

   
 end
end
#*************************************************END****************************************************#

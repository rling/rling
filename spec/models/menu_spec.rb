require 'spec_helper'

describe Menu do
  before(:each) do
    @menu = Menu.new (:name=>'name')
  end




#test for default value...................................

  it "should have default value for position" do
    @menu.position.should == 0
  end

  it "should have default value for level" do
    @menu.level.should == 0
  end

  it "should have default value for parent_id" do
    @menu.parent_id.should == 0
  end

  it "should have default value for menu_view_type" do
    @menu.menu_view_type.should == 0
  end




#test for validation................................................

  it "should contain name" do
    menu = Menu.new :name => nil
    menu.should_not be_valid
  end

  it "should contain menuset_id" do
    menu = Menu.new :menuset_id => nil
    menu.should_not be_valid
  end

  it "should contain menu_view_type" do
    menu = Menu.new :menu_view_type => nil
    menu.should_not be_valid
  end

  it "test for before_save" do
      menu = Menu.new(:name=>'test', :menuset_id=>1)
      menu.should_receive(:set_level)
      menu.save
  end
  it "test for before_destroy" do
      menu = Menu.new
      menu.should_receive(:set_children)
      menu.destroy
  end




#test for belongs_to........................................

  it "should belongs to menuset" do
    @menu = Menu.new
    @menu.menuset.should be_nil
    @menu.menuset=@menuset
    @menu.menuset.should eql(@menuset)
  end

  it "should belongs to page" do
    @menu = Menu.new
    @menu.page.should be_nil
    @menu.page=@page
    @menu.page.should eql(@page)
  end




#test for methods.............................................
 
  it "test levelname method " do
    @menu.level=1
    @menu.levelname.should eql('-- '+ @menu.name) 
  end

  it "test treename method" do
    @menu.treename.should eql(@menu.name)
  end
end

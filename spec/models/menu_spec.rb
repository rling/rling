require 'spec_helper'

describe Menu do
  before(:each) do
    @menu = Menu.new
  end

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

  it "should belongs to menuset" do
    @menu = Menu.new
    @menu.menuset.should be_nil
    @menu.menuset=@menuset
    @menu.menuset .should eql(@menuset)
  end
end

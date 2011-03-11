require 'spec_helper'

describe Menuset do
  before(:each) do
    @attr = {:name => "test"}
    @menuset = Menuset.new(:name => "header")
    @menu = Menu.new(:menuset_id => @menuset.id, :name => "test")
  end



#test for validation.................................................

  it "should reject the duplicate name" do
    Menuset.create!(@attr)
    duplicate_name = Menuset.new(@attr)
    duplicate_name.should_not be_valid
  end

  it "should contain name" do
    menuset = Menuset.new :name => nil
    menuset.should_not be_valid
  end



#test for has_many.............................................

  it "should have many menus" do
    @menuset.menus << Menu.new(:menuset_id=>@menuset.id)
    @menuset.menus << Menu.new(:menuset_id=>@menuset.id)
    @menuset.should have(2).menus
  end



#test for methods...............................................

  it "test treelevel method" do
    @menuset.treelevel.should eql(@menuset.name) 
  end 

  it "test for treename" do
    @menuset.treename.should eql(@menuset.name)
  end

  it "test for levelname" do
    @menuset.levelname.should eql(@menuset.name)
  end
 
end

require 'spec_helper'

describe Categoryset do
  before(:each) do
    @attr = {:name => "test"}
    @categoryset = Categoryset.new(@attr)
  end
  
#test for validation.................................................
  it "should contain name" do
    categoryset = Categoryset.new(:name => nil)
    categoryset.should_not be_valid
  end

  it "should have a unique name" do
    Categoryset.create!(@attr)
    duplicate_name = Categoryset.new(@attr)
    duplicate_name.should_not be_valid
  end

#test for has_many.............................................

  it "should have many categories" do
    @categoryset.categories << Category.new(:categoryset_id=>@categoryset.id)
    @categoryset.categories << Category.new(:categoryset_id=>@categoryset.id)
    @categoryset.should have(2).categories
  end

  it "should have many object_models" do
    @categoryset.object_models << ObjectModel.new(:categoryset_id=>@categoryset.id)
    @categoryset.object_models << ObjectModel.new(:categoryset_id=>@categoryset.id)
    @categoryset.should have(2).object_models
  end

#test for methods...............................................

  it "tests treelevel method" do
    @categoryset.save
    @categoryset.treelevel.should eql(@categoryset.name) 
  end

  it "tests treename method" do
    @categoryset.save
    @categoryset.treename.should eql(@categoryset.name)
  end

  it "tests for levelname" do
    @categoryset.save
    @categoryset.levelname.should eql(@categoryset.name)
  end

end

# == Schema Information
#
# Table name: categorysets
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#


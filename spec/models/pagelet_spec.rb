require 'spec_helper'

describe Pagelet do

  before (:each) do
  @pagelet_attributes={ :handle =>'handle' ,:display_text=>'text' }
  end 
  it "should not be valid without a handle" do
   pagelet=Pagelet.new(@pagelet_attributes.merge(:handle=>nil))
   pagelet.should_not be_valid 
 
   pagelet=Pagelet.new(@pagelet_attributes.merge(:handle=>' '))
   pagelet.should_not be_valid

  end
  
  it "should not be valid without a display_text" do
  pagelet=Pagelet.new(@pagelet_attributes.merge(:display_text=>nil))
  pagelet.should_not be_valid
  
  pagelet=Pagelet.new(@pagelet_attributes.merge(:display_text=>''))
  pagelet.should_not be_valid
 
  end
  it "should have a unique handle " do
   @pagelet=Pagelet.create!(@pagelet_attributes)
   @second_pagelet=Pagelet.new(@pagelet_attributes.merge(:display_text=>'text2'))
   @second_pagelet.should_not be_valid
  end

end

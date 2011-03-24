require 'spec_helper'

describe Mailer do
  before(:each) do
    @attr = { :handle => "test", 
              :subject => "testing",
              :body => "Hello this is for test only"
            }
  end

  it "should have handle" do
    mailer = Mailer.new(@attr.merge(:handle => ''))
    mailer.should_not be_valid
  end

  it "should have a unique handle" do
    first_handle=Mailer.create!(@attr)
    second_handle=Mailer.new(@attr.merge(:handle=>"test"))
    second_handle.should_not be_valid
  end

    it "should have subject" do
    mailer = Mailer.new(@attr.merge(:subject => ''))
    mailer.should_not be_valid
  end
end

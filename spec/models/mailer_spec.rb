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

  it "should have default value 'false' for is_deletable" do
    mailer = Mailer.create!(@attr)
    mailer.is_deletable.should == true
  end
end


# == Schema Information
#
# Table name: mailers
#
#  id              :integer(4)      not null, primary key
#  handle          :string(255)
#  subject         :string(255)
#  body            :text
#  allowable_tags  :string(255)
#  is_deletable    :boolean(1)      default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#  object_form_id  :integer(4)
#  object_model_id :integer(4)
#


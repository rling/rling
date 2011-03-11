require 'spec_helper'

describe Setting do

  before(:each) do
    @attr = { :name => "test",
              :desc_text => "testingtesting",
              :setting_type => "tests"
            }
  end

  it "should have a name" do
    setting = Setting.new(@attr.merge(:name => ''))
    setting.should_not be_valid
  end

  it "should have a descriptive text" do
    setting = Setting.new(@attr.merge(:desc_text => ''))
    setting.should_not be_valid
  end

  it "should have a setting type" do
    setting = Setting.new(@attr.merge(:setting_type => ''))
    setting.should_not be_valid
  end

  it "should only take integral values when 'setting_type'=integer" do
    setting=Setting.new(@attr.merge(:setting_type=>'integer',:setting_value=>'ten'.to_i))
    setting.should be_valid
  end

end

require 'spec_helper'

describe Asset do

  it "should have an attachment :path of :rails_root/public/system/assets/:id/:style/:basename.:extension" do
    Asset.attachment_definitions[:upload][:path].should == ":rails_root/public/system/assets/:id/:style/:basename.:extension"
  end

  it "should have an attachment :url of /system/assets/:id/:style/:basename.:extension" do
    Asset.attachment_definitions[:upload][:url].should == "/system/assets/:id/:style/:basename.:extension"
  end
end

require 'spec_helper'

describe Asset do

  it "should have an attachment :path of :rails_root/public/system/assets/:id/:style/:basename.:extension" do
    Asset.attachment_definitions[:upload][:path].should == ":rails_root/public/system/assets/:id/:style/:basename.:extension"
  end

  it "should have an attachment :url of /system/assets/:id/:style/:basename.:extension" do
    Asset.attachment_definitions[:upload][:url].should == "/system/assets/:id/:style/:basename.:extension"
  end
end

# == Schema Information
#
# Table name: assets
#
#  id                  :integer(4)      not null, primary key
#  upload_file_name    :string(255)
#  upload_content_type :string(255)
#  upload_file_size    :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#


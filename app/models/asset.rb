class Asset < ActiveRecord::Base

  #Associations
  has_attached_file :upload,
                    :url => "/system/assets/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/assets/:id/:style/:basename.:extension",
                    :styles =>  Proc.new { |a| a.instance.attachment_sizes }
  #Validations
  validates_attachment_presence :upload

  #Process for thumbnails while creating images
  before_post_process :thumbnailable?

  #Check if the uploaded is a image
  def thumbnailable?
    is_thumb = !(upload.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
    return !is_thumb
  end

  def attachment_sizes
    thumbs = { :thumb => ["100x100"] }
    unless sizes.nil?
      size_arr = self.sizes.split(',')
      size_arr.each do |size|
        size = size.strip
        thumbs[size]=[size]
      end
    end
    thumbs
  end

   #Store Size in which the thumbnail has to be prepared
   attr_accessor :sizes
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


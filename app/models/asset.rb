class Asset < ActiveRecord::Base
  has_attached_file :upload,
                    :url => "/system/assets/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/assets/:id/:style/:basename.:extension",
                    :styles => {:thumb => Proc.new{|a|a.sizes}}
                    

  before_post_process :thumbnailable?

  def thumbnailable?
    is_thumb = !(upload.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
    puts 33333
    puts !is_thumb
    return !is_thumb
  end
   attr_accessor :sizes
end

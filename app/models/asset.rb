class Asset < ActiveRecord::Base
  has_attached_file :upload,
                    :url => "/system/assets/:id/:basename.:extension",
                    :path => ":rails_root/public/system/assets/:id/:basename.:extension",
                    :styles => lambda { |a|
                                                 if a.instance.thumbnailable?
                                                   {:thumb => [a.instance.sizes]}
  						 end
                                               }
attr_accessor :sizes
before_post_process :thumbnailable?  

  def thumbnailable?
    return false unless upload.content_type
    return ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png', 'image/jpg'].join('').include?(upload.content_type)

end

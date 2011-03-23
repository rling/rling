class Asset < ActiveRecord::Base
  belongs_to :user
  has_attached_file :upload,
                    :url => "/system/assets/:id/:basename.:extension",
                    :path => ":rails_root/public/system/assets/:id/:basename.:extension",
                    :styles => lambda { |a|
                                                 if a.instance.thumbnailable?
                                                   {:thumb => [a.instance.sizes]}
                                                 end
                                               }
  attr_accessor :sizes

  def thumbnailable?
    return false unless asset.content_type
    ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png', 'image/jpg'].join('').include?(asset.content_type)
  end
end

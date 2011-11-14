class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => "/ckeditor_assets/attachments/:id/:filename",
                    :path => ":rails_root/public/ckeditor_assets/attachments/:id/:filename"

  validates_attachment_size :data, :less_than=>100.megabytes

  def url(*args)
    if [:thumb, :content].include?(args.first)
      send("url_#{args.first}")
    else
      data.url(*args)
    end
  end

  def url_content
    data.url
  end

 def url_thumb
   extname = File.extname(filename)

    case extname.to_s
      when '.swf' then '/javascripts/ckeditor/images/swf.gif'
      when '.pdf' then '/javascripts/ckeditor/images/pdf.gif'
      when '.doc', '.txt' then '/javascripts/ckeditor/images/doc.gif'
      when '.mp3' then '/javascripts/ckeditor/images/mp3.gif'
      when '.rar', '.zip', '.tg' then '/javascripts/ckeditor/images/rar.gif'
      when '.xls' then '/javascripts/ckeditor/images/xls.gif'
      else '/javascripts/ckeditor/images/ckfnothumb.gif'
    end
 end

 def to_json(options = {})
   options[:methods] ||= []
   options[:methods] << send(url(:url_content))
   options[:methods] << send(url(:url_thumb))
   super options
 end
end

# == Schema Information
#
# Table name: ckeditor_assets
#
#  id                :integer(4)      not null, primary key
#  data_file_name    :string(255)     not null
#  data_content_type :string(255)
#  data_file_size    :integer(4)
#  assetable_id      :integer(4)
#  assetable_type    :string(30)
#  type              :string(25)
#  guid              :string(10)
#  locale            :integer(1)      default(0)
#  user_id           :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#


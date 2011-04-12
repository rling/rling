class ModelSubmission < ActiveRecord::Base
  include PermalinkHelper
  include ApplicationHelper
  include CacheHelper
  stampable

  #Associations
  has_many :model_datas ,:dependent=>:destroy 
  has_many  :comment_submissions ,:dependent => :destroy,:order =>:level
  belongs_to :object_model
  #validations
  regex_pattern = /\/(?=.*[A-Za-z0-9])[A-Za-z0-9-]+\z/i
  validates :perma_link ,:presence=>true, :uniqueness=>true, :format=>{:with=>regex_pattern ,:message=>"Should contain a  / and alphabets or alphabets and numbers and may contain - separator"}

  #callbacks
  after_create  :clear_cache
  after_update  :clear_cache
  after_destroy :clear_cache

  #instance methods
 # def permalnk
 # return self.perma_link
 # end

 # def permalnk=(value)
 # @permalnk = value
 # end

 def perma_link_generate(title)
     self.perma_link = "/" + generate_perma_link(ModelSubmission,create_permalink(title))
 end

end

# == Schema Information
#
# Table name: model_submissions
#
#  id              :integer(4)      not null, primary key
#  object_model_id :integer(4)
#  perma_link      :string(255)
#  home_page       :boolean(1)
#  page_view_type  :integer(4)      default(0)
#  created_at      :datetime
#  updated_at      :datetime
#  creator_id      :integer(4)
#  updater_id      :integer(4)
#


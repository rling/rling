class ModelSubmission < ActiveRecord::Base
  include PermalinkHelper
  include ApplicationHelper
  include CacheHelper
  stampable

  #Associations
  has_many :model_datas ,:dependent=>:destroy
  belongs_to :object_model
  #validations
  regex_pattern = /\/(?=.*[A-Za-z0-9])[A-Za-z0-9-]+\z/i
  validates :perma_link ,:presence=>true, :uniqueness=>true, :format=>{:with=>regex_pattern ,:message=>"Should contain a  / and alphabets or alphabets and numbers and may contain - separator"}
  #callbacks
  after_create  :clear_cache
  after_update  :clear_cache
  after_destroy :clear_cache

  #instance methods
  def permalnk
  return self.perma_link
  end

  def permalnk=(value)
  @permalnk = value
  end

  def generate_perma_link(perma_link)
   model_submission = ModelSubmission.find_by_perma_link("/"+perma_link)
    if model_submission.nil?
      return perma_link
    else
      count = 0
      until (ModelSubmission.find_by_perma_link("/"+perma_link + "-" + count.to_s).nil?)
        count+=1
      end
      return perma_link + "-" + count.to_s
    end
  end

 def perma_link_generate(title)

     self.perma_link = "/" + generate_perma_link(create_permalink(title))
 end



 

end

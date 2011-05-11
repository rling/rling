class ModelSubmission < ActiveRecord::Base
#Includes
  include PermalinkHelper

  stampable

  #Associations
  belongs_to :object_model
  has_many :model_datas ,:dependent=>:destroy
  has_many  :comment_submissions ,:dependent => :destroy
  has_many :categorizations, :dependent=> :destroy
  has_many :categories, :through=> :categorizations


  #validations
  regex_pattern = /(?=.*[A-Za-z0-9])[A-Za-z0-9-]+\z/i
  validates :perma_link ,:presence=>true, :uniqueness=>true, :format=>{:with=>regex_pattern ,:message=>"Should contain a  / and alphabets or alphabets and numbers and may contain - separator"}

  

  #instance methods
 
 def perma_link_generate(title)
     self.perma_link = generate_perma_link(ModelSubmission,create_permalink(title))
 end

 def enrolled_in?(category)
    self.categories.include?(category)
 end

 def unenrolled_categories
   Category.where(:categoryset_id=>self.object_model.categoryset_id) - self.categories
 end

 def title
   title = self.object_model.model_components.find_by_component_name("title")
   model_data = self.model_datas.find_by_model_component_id(title.id)
   return model_data.nil? ? "" : model_data.data_value
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
#  status          :string(255)
#


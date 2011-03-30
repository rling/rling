class ObjectModel < ActiveRecord::Base
  include PermalinkHelper
  #Associations
  has_many :model_components ,:dependent=>:destroy
  has_many :model_submissions ,:dependent=>:destroy
  #Validations
    regex_pattern = /\/(?=.*[A-Za-z0-9])[A-Za-z0-9-]+\z/i
  validates :perma_link_parent ,:presence=>true, :uniqueness=>true , :format=>{:with=>regex_pattern ,:message=>"Should contain a  / and alphabetsor alphabets and numbers and may contailn - separator"}
  validates :name ,:presence=>true, :uniqueness=>true
#call backs
  after_create :create_2_model_components

# instance Methods


  def permalnkparent
  return self.perma_link
  end

  def permalnkparent=(value)
  @permalnk = value
  end

def generate_perma_link(perma_link)
   object_model = ObjectModel.find_by_perma_link_parent("/"+perma_link)
    if object_model.nil?
      return perma_link
    else
      count = 0
      until (ObjectModel.find_by_perma_link_parent("/"+perma_link + "-" + count.to_s).nil?)
        count+=1
      end
      return perma_link + "-" + count.to_s
    end
  end

 def perma_link_generate
     self.perma_link_parent = "/" + generate_perma_link(create_permalink_parent(self.name))
 end
 
 def create_2_model_components

    model_component1=ModelComponent.new
    model_component1.object_model_id=self.id
    model_component1.component_name='title'
    model_component1.component_display_name='Title'
    model_component1.component_type='Textfield'
    model_component1.default_value='Enter The title'
    model_component1.is_deletable=false
    model_component1.is_mandatory=true
    model_component1.save
    
    model_component2=ModelComponent.new
    model_component2.object_model_id=self.id
    model_component2.component_name='body'
    model_component2.component_display_name='Body'
    model_component2.component_type='Textarea'
    model_component2.default_value='Enter The content'
    model_component2.is_deletable=false
    model_component2.is_mandatory=true
    model_component2.save
    
 end

end

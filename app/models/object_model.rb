class ObjectModel < ActiveRecord::Base
  include PermalinkHelper

  #Associations
  has_many :model_components ,:dependent=>:destroy ,:order =>:position
  has_many :model_submissions ,:dependent=>:destroy

  #Validations
    regex_pattern = /\/(?=.*[A-Za-z0-9])[A-Za-z0-9-]+\z/i
  validates :perma_link_parent ,:presence=>true, :uniqueness=>true , :format=>{:with=>regex_pattern ,:message=>"Should contain a  / and alphabets or alphabets and numbers and may contailn - separator"}
  validates :name ,:presence=>true, :uniqueness=>true

  #call backs
  after_create :create_2_model_components
  after_create :create_permissions
  after_destroy :remove_permissions

  #Instance Methods
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
 
private 

 def create_2_model_components
    self.model_components.create(:component_name=>'title',:component_display_name=>"Title",:component_type=>"Textfield",:default_value=>"Enter a title",:is_deletable=>false,:is_mandatory=>true)
    self.model_components.create(:component_name=>'body',:component_display_name=>"Body",:component_type=>"Textarea",:default_value=>"Enter a Content",:is_deletable=>false,:is_mandatory=>false)
 end

 def create_permissions
    perm = Permission.create(:activity_code=>"create",:activity_display_text=>"Create a #{self.name.capitalize}",:permission_type=>"ObjectModel",:permission_object=>self.name)
    PermissionRole.create(:role_id=>3, :permission_id=>perm.id, :value=>true)
    perm = Permission.create(:activity_code=>"edit",:activity_display_text=>"Modify your own #{self.name.capitalize}",:permission_type=>"ObjectModel",:permission_object=>self.name)
    PermissionRole.create(:role_id=>3, :permission_id=>perm.id, :value=>true)
    perm = Permission.create(:activity_code=>"editother",:activity_display_text=>"Modify others' #{self.name.capitalize}",:permission_type=>"ObjectModel",:permission_object=>self.name)
    PermissionRole.create(:role_id=>3, :permission_id=>perm.id, :value=>true)
    perm = Permission.create(:activity_code=>"delete",:activity_display_text=>"Delete your own #{self.name.capitalize}",:permission_type=>"ObjectModel",:permission_object=>self.name)
    PermissionRole.create(:role_id=>3, :permission_id=>perm.id, :value=>true)
    perm = Permission.create(:activity_code=>"deleteother",:activity_display_text=>"Delete others' #{self.name.capitalize}",:permission_type=>"ObjectModel",:permission_object=>self.name)
    PermissionRole.create(:role_id=>3, :permission_id=>perm.id, :value=>true)
    perm = Permission.create(:activity_code=>"view",:activity_display_text=>"View a #{self.name.capitalize}",:permission_type=>"ObjectModel",:permission_object=>self.name)
    Role.all.each { |role| PermissionRole.create(:role_id=>role.id, :permission_id=>perm.id, :value=>true) }
    perm = Permission.create(:activity_code=>"viewlist",:activity_display_text=>"View all #{self.name.capitalize.pluralize}",:permission_type=>"ObjectModel",:permission_object=>self.name)
    Role.all.each { |role| PermissionRole.create(:role_id=>role.id, :permission_id=>perm.id, :value=>true) }
 end

 def remove_permissions
    permissions = Permission.find(:all,:conditions=>["permission_type=? and permission_object=?","ObjectModel",self.name])
    permissions.each do |permission|
      permission.destroy
    end
 end

end

# == Schema Information
#
# Table name: object_models
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  perma_link_parent :string(255)
#  description       :text
#  created_at        :datetime
#  updated_at        :datetime
#


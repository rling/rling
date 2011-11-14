class Page < ActiveRecord::Base
#Includes
include PermalinkHelper

stampable

#Associations
has_one :menu ,:dependent => :destroy
has_many :page_variables ,:dependent => :destroy
regex_pattern = /(?=.*[A-Za-z0-9])[A-Za-z0-9-]+\z/i
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

#validations
validates :title ,:presence=>true
validates :perma_link ,:presence=>true, :uniqueness=>true ,:format=>{:with=>regex_pattern ,:message=>"Should contain a / and alphabets /alpabets and numbers/ and may have - separator "}
validates :email, :format=> {:with => email_regex } ,:allow_blank =>true

#named scope
scope :pages ,  :conditions =>"type is null"
scope :object_forms,  :conditions =>"type = 'ObjectForm'"
scope :views,  :conditions => "type = 'View'"
scope :category_views, :conditions =>"type = 'CategoryView'"

#callbacks
after_save :set_menu

#instance methods

def menu_menuset_id
 unless self.menu.nil?
   return self.menu.menuset_id
 end
end

def menu_menuset_id=(value)
 @menuset_id = value
end

def menu_parent_id
 menu = Menu.where(:page_id=>self.id).first()
 unless menu.nil?
   return menu.parent_id
 end
end

def menu_parent_id=(value)
 @parent_id=value
end

def perma_link_generate
     self.perma_link = generate_perma_link(Page,create_permalink(self.title))
end

def menu_name
  unless self.id.nil?
  menu = Menu.where(:page_id=>self.id).first()
  unless menu.nil?
   return menu.name
 end
end
end

def menu_name=(value)
 @menu_name=value
end

def published?
  return self.status == "Published"
end

#private methods
private

 def set_menu
   unless @menu_name.nil?
      unless @menu_name.empty?
      menu = self.menu
      if menu.nil?
        menu = Menu.new
      end
      menu.name = @menu_name
      menu.parent_id = @parent_id
      menu.page_id = self.id
      menu.menu_view_type = self.page_view_type
      if @parent_id.to_i < 0
        menu.menuset_id = @parent_id.to_i.abs
      else
        menu.menuset_id= Menu.where(:id=>@parent_id).first().menuset_id
      end
      menu.save
    end
  end
 end

def destroy_menu
 unless self.menu.nil?
   self.menu.destroy
 end
end

end





# == Schema Information
#
# Table name: pages
#
#  id                         :integer(4)      not null, primary key
#  title                      :string(255)
#  body                       :text
#  perma_link                 :string(255)
#  home_page                  :boolean(1)      default(FALSE)
#  page_view_type             :integer(4)      default(0)
#  created_at                 :datetime
#  updated_at                 :datetime
#  type                       :string(255)
#  email                      :string(255)
#  view_type                  :string(255)
#  view_for                   :integer(4)
#  creator_id                 :integer(4)
#  updater_id                 :integer(4)
#  allow_create_on_permission :boolean(1)      default(FALSE)
#  layout                     :string(255)
#  status                     :string(255)
#  default_sort_order         :string(255)
#  default_sort_order_value   :string(255)
#  limit                      :integer(4)
#  associated_view            :integer(4)
#


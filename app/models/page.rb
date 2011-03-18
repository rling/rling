class Page < ActiveRecord::Base
include PermalinkHelper

#callbacks
after_save :set_menu

#Associations
has_one :menu ,:dependent => :destroy
has_many :page_variables ,:dependent => :destroy

#validations
validates :title ,:presence=>true
validates :perma_link ,:presence=>true, :uniqueness=>true

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
 menu = Menu.find_by_page_id(self.id)
 unless menu.nil?
   return menu.parent_id
 end
end

def menu_parent_id=(value)
 @parent_id=value
end

def permalnk
return self.perma_link
end

def permalnk=(value)
 @permalnk = value
end


def menu_name
unless self.id.nil?
 menu = Menu.find_by_page_id(self.id)
 unless menu.nil?
   return menu.name
 end
end
end

def menu_name=(value)
 @menu_name=value
end



def generate_perma_link(perma_link)
    page = Page.find_by_perma_link("/"+perma_link)
    if page.nil?
      return perma_link
    else
      count = 0
      until (Page.find_by_perma_link("/"+perma_link + "-" + count.to_s).nil?)
        count+=1
      end
      return perma_link + "-" + count.to_s
    end
  end

 def perma_link_generate
     self.perma_link = "/" + generate_perma_link(create_permalink(self.title))
 end



#private methods
private

 def set_menu
   unless @menu_name.blank?
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
        menu.menuset_id= Menu.find(@parent_id).menuset_id
      end
      menu.save
    end
  end



def destroy_menu
 unless self.menu.nil?
   self.menu.destroy
 end 
end 

end



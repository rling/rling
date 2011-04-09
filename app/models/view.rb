class View < Page
  include CacheHelper

#Associations
has_many :view_components ,:dependent => :destroy ,:order =>:position

 #call_backs
 after_create :clear_cache
 after_destroy :clear_cache
 after_update :clear_cache


#instance methods
#Components to be displayed which are to be added to the select of view components form
def not_added_components
 model=ObjectModel.find_by_id(self.view_for)
 
 m_component = model.model_components.collect{|mc|mc.component_name}
 m_component << "created_at"
 m_component << "updated_at"
 v_component = self.view_components.collect{|vc|vc.name}
 return  (m_component - v_component)
end

#Get the View For Name
def get_view_for
  model=ObjectModel.find_by_id(self.view_for)
  return ( model.nil? ? nil :  model.name.capitalize.pluralize )
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
#


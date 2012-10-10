class UserView < View
  
has_many :view_components,:foreign_key=>"view_id",:dependent=>:destroy  
#Includes
  include CacheHelper

  
#instance methods
#Components to be displayed which are to be added to the select of view components form
def not_added_components 
 v_component = self.view_components.collect{|vc|vc.name}
 return  (not_added_condition_components - v_component)
end

def published_user_view_submissions
   return self.where(:status =>'Published')
 end

def not_added_condition_components
 m_component = UserDetailSetting.all.collect{|mc|mc.field_name}
 m_component = ["","created_at","updated_at","creator_id","updater_id"] +  m_component
 return  m_component
end
  
#Instance Methods
  def get_view_for
    return "users"
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


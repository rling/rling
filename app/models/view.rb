class View < Page
#Associations
has_many :view_components ,:dependent => :destroy ,:order =>:position

 #call_backs
 after_create :clear_cache
 after_destroy :clear_cache
 after_update :clear_cache


#instance methods

def not_added_components
 model=ObjectModel.find_by_id(self.view_for)
 m_component = model.model_components.collect{|mc|mc.component_name}
 m_component << "created_at"
 m_component << "updated_at"
 v_component = self.view_components.collect{|vc|vc.name}
 return  (m_component - v_component)
end

def get_view_for
  model=ObjectModel.find_by_id(self.view_for)
  return model.name.capitalize.pluralize unless model.nil?
end

end

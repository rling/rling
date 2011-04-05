class View < Page
#Associations
has_many :view_components ,:dependent => :destroy

def not_added_components
 model=ObjectModel.find_by_id(self.view_for)
 m_component = model.model_components.collect{|mc|mc.component_name}
 m_component << "created at"
 m_component << "updated at"
 v_component = self.view_components.collect{|vc|vc.name}
 return  (m_component - v_component)
end

end

class CategoryView < View
  include CacheHelper

#Validations
validates :associated_view, :presence=>true

#Instance Methods
  def get_view_for
    catset= Categoryset.find_by_id(self.view_for)
    return ( catset.nil? ? nil :  catset.name.capitalize )
  end
end

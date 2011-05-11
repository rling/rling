class CategoryView < View
#Includes
  include CacheHelper

#Validations
validates :associated_view, :presence=>true

#Instance Methods
  def get_view_for
    catset= Categoryset.where(:id=>self.view_for)
    return ( catset.nil? ? nil :  catset.name.capitalize )
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


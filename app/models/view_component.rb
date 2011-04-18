class ViewComponent < ActiveRecord::Base

#Associations
belongs_to :view

end



# == Schema Information
#
# Table name: view_components
#
#  id           :integer(4)      not null, primary key
#  view_id      :integer(4)
#  name         :string(255)
#  is_linked    :boolean(1)      default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  position     :integer(4)      default(0)
#  display_name :string(255)
#


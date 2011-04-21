class ViewOrder < ActiveRecord::Base
#Associations
  belongs_to :view
end

# == Schema Information
#
# Table name: view_orders
#
#  id         :integer(4)      not null, primary key
#  view_id    :integer(4)
#  name       :string(255)
#  order      :string(255)
#  created_at :datetime
#  updated_at :datetime
#


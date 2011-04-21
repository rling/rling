class ViewCondition < ActiveRecord::Base
#Associations
belongs_to :view
end

# == Schema Information
#
# Table name: view_conditions
#
#  id            :integer(4)      not null, primary key
#  view_id       :integer(4)
#  name          :string(255)
#  value         :string(255)
#  operator      :string(255)
#  relation_with :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#


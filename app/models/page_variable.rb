class PageVariable < ActiveRecord::Base
#Associations
belongs_to :page
belongs_to :page_variable_setting
end

# == Schema Information
#
# Table name: page_variables
#
#  id                       :integer(4)      not null, primary key
#  page_id                  :integer(4)
#  page_variable_setting_id :integer(4)
#  variable_value           :text
#  created_at               :datetime
#  updated_at               :datetime
#


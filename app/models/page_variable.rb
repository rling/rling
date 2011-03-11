class PageVariable < ActiveRecord::Base
#Associations
belongs_to :page
belongs_to :page_variable_setting
end

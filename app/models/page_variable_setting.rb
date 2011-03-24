class PageVariableSetting < ActiveRecord::Base
#Associations
has_many :page_variables ,:dependent=>:destroy
#Validations
validates :name ,:presence=>true ,:uniqueness=>true
end

# == Schema Information
#
# Table name: page_variable_settings
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  default_value :text
#  created_at    :datetime
#  updated_at    :datetime
#


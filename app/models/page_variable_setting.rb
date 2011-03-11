class PageVariableSetting < ActiveRecord::Base
#Associations
has_many :page_variables ,:dependent=>:destroy
#Validations
validates :name ,:presence=>true ,:uniqueness=>true
end

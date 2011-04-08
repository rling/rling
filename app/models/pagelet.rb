class Pagelet < ActiveRecord::Base
#Validations
 validates :handle, :presence => true, :uniqueness=> true, :length => { :maximum => 250}
 validates :display_text, :presence=>true
end 


# == Schema Information
#
# Table name: pagelets
#
#  id           :integer(4)      not null, primary key
#  handle       :string(255)
#  display_text :text
#  created_at   :datetime
#  updated_at   :datetime
#


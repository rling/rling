class Pagelet < ActiveRecord::Base
#Validations
 validates :handle, :presence => true, :uniqueness=> true, :length => { :maximum => 250}
 validates :display_text, :presence=>true
end 


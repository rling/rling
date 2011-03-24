class Mailer < ActiveRecord::Base
  #Validations
  validates :handle, :presence=>true, :uniqueness=>true
  validates :subject, :presence=>true

end

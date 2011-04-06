class ObjectForm < Page
#Associations
has_many :form_components ,:dependent => :destroy
has_many :form_submissions,:dependent => :destroy
#call backs
after_create :create_email_template ,:clear_cache
after_destroy :clear_cache
after_update :clear_cache

#instance methods
 def create_email_template
    subject= "Form has been submitted for #{self.title} page"
   body='Sample body template. Please Modify once all the form components are created'
    mailer=Mailer.new
    mailer.handle=self.perma_link
    mailer.subject=subject
    mailer.body=body
    mailer.is_deletable=false
   
    mailer.save
  end

end



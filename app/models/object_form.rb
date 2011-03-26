class ObjectForm < Page
#Associations
has_many :form_components ,:dependent => :destroy
has_many :submission_forms,:dependent => :destroy

after_create :create_email_template
 def create_email_template
    subject= "Form has been submitted for #{self.title} page"
   body='Sample body tenplate. Please Modify once all the form components are created'
    mailer=Mailer.new
    mailer.handle=self.perma_link
    mailer.subject=subject
    mailer.body=body
    mailer.is_deletable=false
    mailer.allowable_tags='FormData'
    mailer.save
  end
end



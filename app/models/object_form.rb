class ObjectForm < Page
#Includes
  include CacheHelper

#Associations
has_many :form_components ,:dependent => :destroy ,:order=> :position
has_many :form_submissions,:dependent => :destroy
has_one :mailer, :dependent => :destroy

#call backs
after_create :create_email_template ,:clear_cache
after_update :clear_cache

#instance methods
 #Create email template that would be used when any submissions occur
 def create_email_template
    subject= "Form has been submitted for #{self.title} page"
    body='Sample body template. Please Modify once all the form components are created'
    self.create_mailer(:handle=>self.perma_link,:subject=>subject,:body=>body,:is_deletable=>false,:allowable_tags=>'FormSubmission')
 end

end





# == Schema Information
#
# Table name: pages
#
#  id                         :integer(4)      not null, primary key
#  title                      :string(255)
#  body                       :text
#  perma_link                 :string(255)
#  home_page                  :boolean(1)      default(FALSE)
#  page_view_type             :integer(4)      default(0)
#  created_at                 :datetime
#  updated_at                 :datetime
#  type                       :string(255)
#  email                      :string(255)
#  view_type                  :string(255)
#  view_for                   :integer(4)
#  creator_id                 :integer(4)
#  updater_id                 :integer(4)
#  allow_create_on_permission :boolean(1)      default(FALSE)
#  layout                     :string(255)
#  status                     :string(255)
#  default_sort_order         :string(255)
#  default_sort_order_value   :string(255)
#  limit                      :integer(4)
#  associated_view            :integer(4)
#


class ObjectForm < ActiveRecord::Base
belongs_to:page
has_many :object_form_components
has_many :object_form_submissions
 email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email_id , :format=> {:with => email_regex }
end

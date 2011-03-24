class ObjectForm < Page
#Associations
has_many :object_form_components ,:dependent => :destroy
has_many :object_form_submissions ,:dependent => :destroy
end

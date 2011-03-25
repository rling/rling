class ObjectForm < Page
#Associations
has_many :form_components ,:dependent => :destroy
has_many :submission_forms,:dependent => :destroy
end



class ObjectForm < Page
#Associations
has_many :form_components ,:dependent => :destroy
has_many :form_submissions ,:dependent => :destroy
end



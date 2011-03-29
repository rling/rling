class FormComponent < ActiveRecord::Base
#Associations
belongs_to :object_form
has_many   :form_datas ,:dependent => :destroy
#Validations
validates :component_name, :presence=>true,:length=>{:minimum=>3}
validates :component_type, :presence=>true
validates :component_display_name, :presence=>true
end

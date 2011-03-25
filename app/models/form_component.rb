class FormComponent < ActiveRecord::Base
belongs_to :object_form
has_many   :form_datas ,:dependent => :destroy
validates :component_name, :presence=>true,:uniqueness=>true,:length=>{:minimum=>3}
validates :component_type, :presence=>true
end

class FormComponent < ActiveRecord::Base
belongs_to :object_form
name_regex = /^[a-zA-Z0-9]+$/
validates :component_name, :presence=>true,:uniqueness=>true,:length=>{:minimum=>3},
            :format=> {:with => name_regex }
validates :component_type, :presence=>true
end

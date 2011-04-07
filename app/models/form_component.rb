class FormComponent < ActiveRecord::Base
  include CacheHelper

#Associations
belongs_to :object_form
has_many   :form_datas ,:dependent => :destroy
#Validations
name_regex = /^[a-zA-Z0-9\-_]+$/
validates :component_name, :presence=>true,:length=>{:minimum=>3},:format=> {:with => name_regex}
validates :component_type, :presence=>true
validates :component_display_name, :presence=>true

after_save   :clear_cache
after_update :clear_cache
after_destroy :clear_cache

  
end

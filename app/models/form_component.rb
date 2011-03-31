class FormComponent < ActiveRecord::Base
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

  def clear_cache
  root_path = Rails.root.to_s + "/tmp/cache"
  entries = Dir.entries(root_path)
  entries.each do |entry|
   unless (entry == "." || entry == "..")
       FileUtils.rm_rf(root_path + "/"+ entry)
   end
end
end
end

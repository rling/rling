class CommentComponent < ActiveRecord::Base
#Associations
belongs_to :object_model
has_many   :comment_datas ,:dependent => :destroy

#Validations

name_regex = /^[a-zA-Z0-9\-_]+$/
validates :component_name, :presence=>true,:length=>{:minimum=>3},:format=> {:with => name_regex}
validates :component_type, :presence=>true
validates :component_display_name, :presence=>true

end

class CommentComponent < ActiveRecord::Base
#Associations
belongs_to :object_model
has_many   :comment_data ,:dependent => :destroy

#Validations

name_regex = /^[a-zA-Z0-9\-_]+$/
validates :component_name, :presence=>true,:length=>{:minimum=>3},:format=> {:with => name_regex}
validates :component_type, :presence=>true
validates :component_display_name, :presence=>true

end

# == Schema Information
#
# Table name: comment_components
#
#  id                     :integer(4)      not null, primary key
#  object_model_id        :integer(4)
#  component_name         :string(255)
#  component_display_name :string(255)
#  component_type         :string(255)
#  component_values       :text
#  default_value          :string(255)
#  mandatory              :boolean(1)      default(FALSE)
#  position               :integer(4)      default(0)
#  created_at             :datetime
#  updated_at             :datetime
#


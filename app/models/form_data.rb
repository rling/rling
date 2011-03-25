class FormData < ActiveRecord::Base
  belongs_to :form_component
  belongs_to :submission_form
end

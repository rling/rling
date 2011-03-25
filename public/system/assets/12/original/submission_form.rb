class SubmissionForm < ActiveRecord::Base
  belongs_to :object_form
  has_many   :form_datas, :dependent => :destroy
end

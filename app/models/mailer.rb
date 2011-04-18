class Mailer < ActiveRecord::Base
  #Associations
  belongs_to :model_submission
  belongs_to :object_form

  #Validations
  validates :handle, :presence=>true, :uniqueness=>true
  validates :subject, :presence=>true
end


# == Schema Information
#
# Table name: mailers
#
#  id              :integer(4)      not null, primary key
#  handle          :string(255)
#  subject         :string(255)
#  body            :text
#  allowable_tags  :string(255)
#  is_deletable    :boolean(1)      default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#  object_form_id  :integer(4)
#  object_model_id :integer(4)
#


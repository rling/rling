class FormData < ActiveRecord::Base
  belongs_to :form_component
  belongs_to :form_submission

  def self.tags(handle)
    objform = ObjectForm.find_by_perma_link(handle)
    array = Array.new
    objform.form_components.each do |form_component|
      array << form_component.component_name
    end
   return array
  end

end

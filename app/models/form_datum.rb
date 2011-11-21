class FormDatum < ActiveRecord::Base
  #Associations
  belongs_to :form_component
  delegate :component_name, :component_type , :to => :form_component, :prefix => true
  belongs_to :form_submission

def self.update_data(page, form_submission, form_data)
  page.form_components.each do |component|
       form_data_obj = FormDatum.where(:form_submission_id=>form_submission.id,:form_component_id => component.id).first
       form_data_obj = FormDatum.new(:form_submission_id=>form_submission.id,:form_component_id=>component.id) if form_data_obj.nil?
        case component.component_type
        when "File"
           unless form_data[component.component_name].nil?
            unless form_data_obj.data_value.blank?
              asset = Asset.find(form_data_obj.data_value)
              asset.destroy
            end
            asset = Asset.create(:sizes=>component.default_value,:upload=>form_data[component.component_name])
            form_data_obj.data_value = asset.id.to_s
          end
        else
        form_data_obj.data_value = form_data[component.component_name]
       end
       form_data_obj.save
     end
end
end

# == Schema Information
#
# Table name: form_data
#
#  id                 :integer(4)      not null, primary key
#  form_component_id  :integer(4)
#  data_value         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  form_submission_id :integer(4)
#


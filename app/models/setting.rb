class Setting < ActiveRecord::Base
#Validations
  validates :name, :presence=> true
  validates :desc_text, :presence=> true
  validates :setting_type, :presence=> true

#Instance Methods

#Need this to convert the string data stored in the server to convert it to actual value.
 def setting_data
   data = setting_value
   case self.setting_type
    when "boolean"
     data = (setting_value=="true") rescue nil
    when "integer"
     data = setting_value.to_i rescue nil
    when "float"
     data = setting_value.to_f rescue nil
    when "date"
     data = Date.parse(setting_value) rescue nil
    when "datetime"
     data = Datetime.strptime(setting_value) rescue nil
   end
   return data
 end
end

# == Schema Information
#
# Table name: settings
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  desc_text     :string(255)
#  setting_value :text
#  setting_type  :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#


class Setting < ActiveRecord::Base
#Validations
  validates :name, :presence=> true
  validates :desc_text, :presence=> true
  validates :setting_type, :presence=> true

#Class Methods
 def setting_data
   data = setting_value
   case self.setting_type
    when :boolean
     data = (setting_value=="true") rescue nil     
    when :integer
     data = setting_value.to_i rescue nil
    when :float
     data = setting_value.to_f rescue nil
    when :date
     data = Date.parse(setting_value) rescue nil
    when :datetime
     data = Datetime.strptime(setting_value) rescue nil
   end
   return data
 end
end

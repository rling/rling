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

def self.session_setting
     session[:settings] = Hash.new
     session[:settings][:body_background_color]=Setting.find_by_name("body_background_color").setting_value
     session[:settings][:top_bar_background_color]=Setting.find_by_name("top_bar_background_color").setting_value
     session[:settings][:top_bar_text_color]=Setting.find_by_name("top_bar_text_color").setting_value
     session[:settings][:top_bar_link_color]=Setting.find_by_name("top_bar_link_color").setting_value
     session[:settings][:top_bar_link_hover_color]=Setting.find_by_name("top_bar_link_hover_color").setting_value
     session[:settings][:header_background_color] = Setting.find_by_name("header_background_color").setting_value
     session[:settings][:header_logo]=Setting.find_by_name("header_logo").setting_value
     session[:settings][:header_website_text_color]=Setting.find_by_name("header_website_text_color").setting_value
     session[:settings][:heading_website_tag_color]=Setting.find_by_name("heading_website_tag_color").setting_value
     session[:settings][:header_website_font_size]=Setting.find_by_name("header_website_font_size").setting_value
     session[:settings][:header_website_text]=Setting.find_by_name("header_website_text").setting_value
     session[:settings][:header_website_tag_text]=Setting.find_by_name("header_website_tag_text").setting_value
     session[:settings][:header_website_tag_font_size]=Setting.find_by_name("header_website_tag_font_size").setting_value
     session[:settings][:menu_bar_background_color]=Setting.find_by_name("menu_bar_background_color").setting_value
     session[:settings][:menu_bar_hover_menu_background_color]=Setting.find_by_name("menu_bar_hover_menu_background_color").setting_value
     session[:settings][:menu_bar_hover_menu_text_color]=Setting.find_by_name("menu_bar_hover_menu_text_color").setting_value
     session[:settings][:menu_bar_menu_text_color]=Setting.find_by_name("menu_bar_menu_text_color").setting_value
     session[:settings][:menu_bar_menu_background_color]=Setting.find_by_name("menu_bar_menu_background_color").setting_value
     session[:settings][:middle_border_color]=Setting.find_by_name("middle_border_color").setting_value
     session[:settings][:middle_background_color]=Setting.find_by_name("middle_background_color").setting_value
     session[:settings][:middle_text_color] =Setting.find_by_name("middle_text_color").setting_value
     session[:settings][:footer_background_color]=Setting.find_by_name("footer_background_color").setting_value
     session[:settings][:footer_text_color]=Setting.find_by_name("footer_text_color").setting_value
     session[:settings][:footer_link_color]=Setting.find_by_name("footer_link_color").setting_value
     session[:settings][:footer_link_hover_color]=Setting.find_by_name("footer_link_hover_color").setting_value
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


module UsersHelper
  def check_field_type(setting_obj,user)
      field_obj = UserDetail.find_by_user_id_and_user_detail_setting_id(user.id,setting_obj.id)
      field_value = setting_obj.default_value
      field_value = field_obj.selected_value unless field_obj.nil?
      return return_field_tag(setting_obj.field_name,field_value,setting_obj.field_type,setting_obj.field_values,field_obj)
  end
end

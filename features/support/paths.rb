module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #


  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /new ^(.*) page$/i
       "/#{$1}/new"
    when /^(.*) index page/i
       "/#{$1}s/"
    when /new menuset/
        new_menuset_path

    when /first user/
        first_user_sessions_path

    when /login/
        new_session_path

    when /logout page/
        logout_path

    when /menuset destroy/
        menuset_path
 
    when /new menu/
        new_menu_path

    when /menu show/
        menu_path

    when /menu destroy/
        menu_path

    when /edit menu/
        edit_menu_path

    when /index menu/
       menus_path

    when /edit user/
       edit_user_path

    when /user_detail_settings/
      user_detail_settings_path

    when /new user_detail_setting/
      new_user_detail_setting_path

    when /show user_detail_setting/
      user_detail_setting_path

    when /edit user_detail_setting/
      edit_user_detail_setting_path

    when /user_detail_setting destroy/
        user_detail_setting_path

    when /new role/
        new_role_path

    when /role destroy/
      role_path

    when /new mailer/
      new_mailer_path

    when /new pagelet/
      new_pagelet_path

    when /new pages /
      new_page_path
   
    when /edit pages/
      edit_page_path

    when /new page_variable_setting/
      new_page_variable_setting_path

    when /account page/
      account_path

    when /object_form_index page/
      object_form_index_pages_path

    when /new object_form page/
      new_object_form_pages_path

    when /new object_model/
      new_object_model_path

    when /new model_components/
      new_object_model_model_component_path @object_model

    when /admin page/
      admin_path

    when /new model_submissions page/
      new_object_model_model_submission_path @object_model
  
    when /user_details page/
      user_details_user_path @user

    when /view_index page/
      view_index_pages_path

    when /new_view page/
      new_view_pages_path

    when /new view_component page/
      new_view_view_component_path @view

    when /new form_component page/
      new_object_form_form_component_path @object

    when /admission page/
      '/admission'


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

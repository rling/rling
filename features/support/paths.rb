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

    when /user details setting/
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

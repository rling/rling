class Notifier < ActionMailer::Base
include ApplicationHelper
default :from => "heurion.com" 
def forgot_password(user)
      @user = user.login
      @reset_password_key= user.reset_password_key if user.recently_reset?
      @url= "#{get_setting("site_url")}/password_resets/#{@reset_password_key}/reset"
      mail(:to => user.email, :subject => "link to create a password")
end
end

class Notifier < ActionMailer::Base
include ApplicationHelper
default :from => "heurion.com" 
def forgot_password(user)
      @user = user.login
      @reset_password_key= user.reset_password_key if user.recently_reset?
      @url= "#{get_setting("site_url")}/password_resets/#{@reset_password_key}/reset"
      mail(:to => user.email, :subject => "link to create a password")
end

def activation_key(user)
    @user=user.login
    @activation_key= user.activation_key if user.recently_activated?
    @url= "#{get_setting("site_url")}/users/#{@activation_key}/activate"
    mail(:to => user.email, :subject => "Link to activate account")
end

def welcome_email(user)
  @user=user.login
  mail(:to=> user.email,:subject=> "Welcome #{@user}")
end

end

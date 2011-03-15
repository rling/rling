class Notifier < ActionMailer::Base
default :from => "heurion.com" 
def forgot_password(user)
      @user = user.login
      @reset_password_key= user.reset_password_key
      mail(:to => user.email, :subject => "link to create a password")
end
end

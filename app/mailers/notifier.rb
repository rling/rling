class Notifier < ActionMailer::Base
def active(user)
    @user = user
    @sender = "palashbasu28@gmail.com"
    mail(:to => user.email,
         :from => "palashbasu28@gmail.com",
         :subject => "email activation")
 end
 def welcome(user)
    @user = user
    @sender = "palashbasu28@gmail.com"
    mail(:to => user.email,
         :from => "palashbasu28@gmail.com",
         :subject => "welocome email")
 end
 def forgot_password(to, login, pass, sent_at = Time.now)
    @user = login
    @password= pass
    @sender = "palashbasu28@gmail.com"
    mail(:to => to,
         :from => "palashbasu28@gmail.com",
         :subject => "Your password.......")

  end
  def send_password(u)
    @user = u
    @sender = "palashbasu28@gmail.com"
    mail(:to => u.email,
         :from => "palashbasu28@gmail.com",
         :subject => "Reset password.......")
  end
end

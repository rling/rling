class Notifier < ActionMailer::Base
include ApplicationHelper

def setup

 # sample setting test looks like this
 # address:smtp.rlingcms.com;port:25;domain:mail.rlingcms.com;authentication:plain;user_name:myusername;password:mypassword;"

 setting = Setting.find_by_name("smtp_settings")
 smtp_setting_string = setting.setting_data
 smtp_settings = smtp_setting_string.split(';')
 smtp_hash = Hash.new
 smtp_settings.each do |smtp_setting|
   smtp_entries = smtp_setting.split(':')
   smtp_hash[smtp_entries[0]]=smtp_entries[1]
 end
 Notifier.smtp_settings = smtp_hash
end
def forgot_password(user)
      #setup
      @user = user.login
      @reset_password_key= user.reset_password_key if user.recently_reset?
      @url= "#{get_setting("site_url")}/password_resets/#{@reset_password_key}/reset"
      mail(:to => user.email, :subject => "link to create a password")
end


def activation_email(user)
  #setup
  @user=user.login
  mailer=Mailer.find_by_subject('Activation Mail')
  @activation_key= user.activation_key if user.recently_activated?
  @url= "#{get_setting("site_url")}/users/#{@activation_key}/activate"
  subject=mailer.subject
  body=mailer.body
  mail(:to => user.email, :subject => subject, :body=>body + @url)
end

  def welcome_email(user)

  #setup
  @user=user.login
  mailer=Mailer.find_by_subject('Welcome Mail')
  subject=mailer.subject
  body=mailer.body
  mail(:to=> user.email,:subject=> subject,:body=> body)
  end

  def send_mailers_email(to,cc,bcc,subject,body)
   #setup
    mail(:to=> to,:cc=> cc,:bcc=> bcc,:subject=> subject,:body=> body)
  end
end

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
      mailer=Mailer.find_by_handle('forgot')
      subject=mailer.subject
      body=mailer.body
      body = verify_tags(body,user)
      mail(:to => user.email, :subject => subject,:body=>body)
end


def activation_email(user)
  #setup
  @user=user.login
  mailer=Mailer.find_by_handle('activation')
  subject=mailer.subject
  body=mailer.body
  body = verify_tags(body,user)
  mail(:to => user.email, :subject => subject, :body=>body)
end

  def welcome_email(user)
  #setup
  @user=user.login
  mailer=Mailer.find_by_handle('welcome')
  subject=mailer.subject
  body=mailer.body
  body = verify_tags(body,user)
  mail(:to=> user.email,:subject=> subject,:body=> body)
  end

  def delete_user(user)
    @user=user.login
    mailer=Mailer.find_by_handle('delete')
    subject=mailer.subject
    body=mailer.body
    body = verify_tags(body,user)
    mail(:to=> user.email,:subject=> subject,:body=>body)
  end

  def send_mailers_email(to,cc,bcc,subject,body)
   #setup
    mail(:to=> to,:cc=> cc,:bcc=> bcc,:subject=> subject,:body=> body)
  end

  def form_submitted(submission)
   unless submission.object_form.email.blank?
      #setup
      mailer=Mailer.find_by_handle(submission.object_form.perma_link)
      subject=mailer.subject
      body=mailer.body
      body=verify_tags(body,submission)
      mail(:to=>submission.object_form.email,:subject=>subject,:body=>body)
   end
  end

  private

  def verify_tags(body,entity)
    output = body
    codes = body.split("&lt;RLING::")
    if codes.size > 0
       first = true
       hash = Hash.new
       codes.each do |code|
         if first
           first = false
           next
         end
         tag = code.split('&gt;')[0]
         splits = tag.split("::")
         objectname = splits[0]
         variablename = splits[1]
         hash[tag] = [objectname,variablename]
       end
       hash.each do |k,v|
         objectname = v[0]
         varname = v[1]
         if entity.class.to_s.upcase == objectname
         	output = output.gsub("&lt;RLING::#{k}&gt;",entity.send("get_variable_info",varname.downcase).to_s)
         end 
       end
    end
    return output
  end
end

class Notifier < ActionMailer::Base
include ApplicationHelper

def setup

 # sample setting test looks like this
 # address:smtp.rlingcms.com;port:25;domain:mail.rlingcms.com;authentication:plain;user_name:myusername;password:mypassword;"

 setting = Setting.find_by_name("smtp_settings")
 smtp_setting_string = setting.setting_data
 smtp_chomp=smtp_setting_string.chomp
 smtp_settings = smtp_chomp.split(';')
 smtp_hash = Hash.new
 smtp_settings.each do |smtp_setting|
   smtp_chomp= smtp_setting.chomp
   smtp_entries = smtp_chomp.split(':')
   smtp_hash[smtp_entries[0]]=smtp_entries[1]
 end
 #Notifier.delivery_method = :smtp
 #Notifier.default_content_type = "text/html"
 Notifier.smtp_settings[:address] = smtp_hash["address"] unless smtp_hash["address"].nil?
 Notifier.smtp_settings[:port] = smtp_hash["port"].to_i unless smtp_hash["port"].nil?
 Notifier.smtp_settings[:domain] = smtp_hash["domain"] unless smtp_hash["domain"].nil?
 Notifier.smtp_settings[:authentication] = smtp_hash["authentication"] unless smtp_hash["authentication"].nil?
 Notifier.smtp_settings[:user_name] = smtp_hash["user_name"] unless smtp_hash["user_name"].nil?
 Notifier.smtp_settings[:password] = smtp_hash["password"] unless smtp_hash["password"].nil?
 unless smtp_hash["enable_starttls_auto"].nil? 
  Notifier.smtp_settings[:enable_starttls_auto]= (smtp_hash["enable_starttls_auto"]=="true")
 end
end
def forgot_password(user)
      setup
      @user = user.login
      mailer=Mailer.find_by_handle('forgot')
      subject=mailer.subject
      body=mailer.body
      body = verify_tags(body,user)
      mail(:from=>User.admins.first.email, :to => user.email, :subject => subject,:body=>body)
end


def activation_email(user)
  setup
  @user=user.login
  mailer=Mailer.find_by_handle('activation')
  subject=mailer.subject
  body=mailer.body
  body = verify_tags(body,user)
  mail(:from=>User.admins.first.email,:to => user.email, :subject => subject, :body=>body)
end

  def welcome_email(user)
  setup
  @user=user.login
  mailer=Mailer.find_by_handle('welcome')
  subject=mailer.subject
  body=mailer.body
  body = verify_tags(body,user)
  mail(:from=>User.admins.first.email,:to=> user.email,:subject=> subject,:body=> body)
  end

  def send_mailers_email(to,cc,bcc,subject,body)
   setup
    mail(:from=>User.admins.first.email,:to=> to,:cc=> cc,:bcc=> bcc,:subject=> subject,:body=> body)
  end

  def form_submitted(submission)
   unless submission.object_form.email.blank?
      setup
      mailer=Mailer.find_by_handle(submission.object_form.perma_link)
      subject=mailer.subject
      body=mailer.body
      body=verify_tags(body,submission)
      mail(:from=>User.admins.first.email,:to=>submission.object_form.email,:subject=>subject,:body=>body)
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

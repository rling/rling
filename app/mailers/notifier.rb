class Notifier < ActionMailer::Base
include ApplicationHelper

default :content_type=>"text/html"

#initial setup for the emails to be sent.
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

#Send email on forgot password
def forgot_password(user)
      setup
      @user = user.login
      mailer=Mailer.find_by_handle('forgot')
      subject=mailer.subject
      body = verify_tags(mailer.body,user)
      mail(:from=>User.admins.first.email, :to => user.email, :subject => subject,:body=>body)
end

#Send email on activation completed
def activation_email(user)
  setup
  @user=user.login
  mailer=Mailer.find_by_handle('activation')
  subject=mailer.subject
  body = verify_tags(mailer.body,user)
  mail(:from=>User.admins.first.email,:to => user.email, :subject => subject, :body=>body)
end

#send email on user registration
  def welcome_email(user)
  setup
  @user=user.login
  mailer=Mailer.find_by_handle('welcome')
  subject=mailer.subject
  body = verify_tags(mailer.body,user)
  mail(:from=>User.admins.first.email,:to=> user.email,:subject=> subject,:body=> body)
  end

#send email on send email button click in the mailers section
  def send_mailers_email(to,cc,bcc,subject,body)
   setup
    mail(:from=>User.admins.first.email,:to=> to,:cc=> cc,:bcc=> bcc,:subject=> subject,:body=> body)
  end

#send email when form has been submitted by end user and email field is not empty
  def form_submitted(submission)
   unless submission.object_form.email.blank?
      setup
      mailer=Mailer.find_by_handle(submission.object_form.perma_link)
      subject=mailer.subject
      body=verify_tags(mailer.body,submission)
      mail(:from=>User.admins.first.email,:to=>submission.object_form.email,:subject=>subject,:body=>body)
   end
  end

#Send email whenever a comment has been submitted to a Model and email to be recieved to the person who creator of the model submission.
   def comment_submitted(submission)
    object_model = submission.model_submission.object_model
    if object_model.email_on_comment && !submission.creator_id.nil?
      setup
      mailer=Mailer.find_by_handle(object_model.perma_link_parent)
      subject=mailer.subject
      body=verify_tags(mailer.body,submission)
      to_user=User.find_by_id(submission.model_submission.creator_id)
      unless to_user.nil?
        mail(:from=>User.admins.first.email,:to=>to_user.email,:subject=>subject,:body=>body)
      end
    end
  end

  private

#Replace tags in email with data as necessary from the object information. 
  def verify_tags(body,entity)
    output = body
    codes = body.scan(/&lt;RLING::[a-zA-Z]*::[a-zA-Z0-9_]*&gt;/)
    unless codes.nil?
      codes.each do |code|
         code = code.gsub("&lt;","").gsub("&gt;","").strip
         splits = code.split("::")
          if entity.class.to_s.upcase == splits[1]
            output = output.gsub("&lt;RLING::#{splits[1]}::#{splits[2]}&gt;",entity.send("get_variable_info",splits[2].downcase).to_s)
         end 
      end
    end
    return output
  end
end


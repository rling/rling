#Create Basic Menusets
Menuset.create(:name=>"Header",:description=>"Header Menu for RlingCMS")
Menuset.create(:name=>"Footer",:description=>"Footer Menu for RlingCMS")

#Create Roles
Role.create(:role_type=>"Anonymous",:is_deletable=>false)
Role.create(:role_type=>"User",:is_deletable=>false)
Role.create(:role_type=>"Administrator",:is_deletable=>false)

#Create Login Settings
Setting.create(:name=>"allow_user_register_user",:desc_text=>"Should the System allow users to sign up to the website on their own. i.e. Should there be a sign up link for the user to execute",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"allow_admin_register_user",:desc_text=>"Should the System allow administrators to self register users to the website",:setting_type=>"boolean",:setting_value=>"true")
Setting.create(:name=>"send_welcome_email",:desc_text=>"If a user is registered, should there be a welcome email sent to the user on registration",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"is_login_type_email",:desc_text=>"Should the login to the website be done using the login or by using the email address of the user",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"user_activation_required_on_user",:desc_text=>"Should the System send activation email when the user registers into the website",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"user_activation_required_on_admin",:desc_text=>"Should the System send activation email when the admin registers the user using admin panel in the website",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"site_url",:desc_text=>"URL of the Site that is required to go out as external links. e.g. in emails, on pages, etc.,",:setting_type=>"string",:setting_value=>"http://localhost:3000")
Setting.create(:name=>"smtp_settings",:desc_text=>"SMTP Configuration settings required to send emails from the CMS",:setting_type=>"string",:setting_value=>"address:smtp.rlingcms.com;port:25;domain:mail.rlingcms.com;authentication:plain;user_name:myusername;password:mypassword;")

#Create Mailer Settings
Mailer.create(:handle=>"welcome",:subject=>"Welcome Mail",:body=>"Welcome to Rling CMS. You have been registered successfully",:is_deletable=>"false")
Mailer.create(:handle=>"activation",:subject=>"Activation Mail",:body=>"Welcome to Rling CMS. Click on the activation link below to activate your account",:is_deletable=>"false")
Mailer.create(:handle=>"forgot",:subject=>"Reset Password",:body=>"Click on the link below to reset your password",:is_deletable=>"false")
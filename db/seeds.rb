#Create Basic Menusets
Menuset.create(:name=>"Header",:description=>"Header Menu for RlingCMS")
Menuset.create(:name=>"Footer",:description=>"Footer Menu for RlingCMS")

#Create Roles
Role.create(:role_type=>"Anonymous",:is_deletable=>false)
Role.create(:role_type=>"User",:is_deletable=>false)
Role.create(:role_type=>"Administrator",:is_deletable=>false)

#Create Page Variables
PageVariableSetting.create(:name=>"SEO Meta Title")
PageVariableSetting.create(:name=>"SEO Meta Description")
PageVariableSetting.create(:name=>"SEO Meta Keywords")

#Create Login Settings
Setting.create(:name=>"allow_user_register_user",:desc_text=>"Should the System allow users to sign up to the website on their own. i.e. Should there be a register link for the user to execute", :setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"allow_admin_register_user",:desc_text=>"Should the System allow administrators to self register users to the website",:setting_type=>"boolean",:setting_value=>"true")
Setting.create(:name=>"send_welcome_email",:desc_text=>"If a user is registered, should there be a welcome email sent to the user on registration",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"is_login_type_email",:desc_text=>"Should the login to the website be done using the login or by using the email address of the user",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"user_activation_required_on_user",:desc_text=>"Should the System send activation email when the user registers into the website",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"user_activation_required_on_admin",:desc_text=>"Should the System send activation email when the admin registers the user using admin panel in the website",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"site_url",:desc_text=>"URL of the Site that is required to go out as external links. e.g. in emails, on pages, etc.,",:setting_type=>"string",:setting_value=>"http://localhost:3000")
Setting.create(:name=>"smtp_settings",:desc_text=>"SMTP Configuration settings required to send emails from the CMS",:setting_type=>"string",:setting_value=>"address:smtp.rlingcms.com; port:25; domain:mail.rlingcms.com; authentication:plain; user_name:myusername; password:mypassword;")
Setting.create(:name=>"allow_view_user_account",:desc_text=>"Can a user view another users account info when he clicks on the name of the user who submitted a post",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"smtp_settings",:desc_text=>"SMTP Configuration settings required to send emails from the CMS",:setting_type=>"string",:setting_value=>"address:smtp.rlingcms.com; port:25; domain:mail.rlingcms.com; authentication:plain; user_name:myusername; password:mypassword;")
Setting.create(:name=>"allow_view_user_account",:desc_text=>"Can a user view another users account info when he clicks on the name of the user who submitted a post",:setting_type=>"boolean",:setting_value=>"false")
Setting.create(:name=>"header_background_color",:desc_text=>"header background color",:setting_type=>"colorbox",:setting_value=>"BF2E1B")
Setting.create(:name=>"top_bar_background_color",:desc_text=>"top bar background color",:setting_type=>"colorbox",:setting_value=>"BF2E1B")
Setting.create(:name=>"dashboard_main_background_color",:desc_text=>"dashboard main background color",:setting_type=>"colorbox",:setting_value=>"F4F4F4")
Setting.create(:name=>"footer_link",:desc_text=>"footer link color ",:setting_type=>"colorbox",:setting_value=>"BF2E1B")
Setting.create(:name=>"header_text_menu_color",:desc_text=>"header_text_menu color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"header_menu_hover_color",:desc_text=>"header menu hover color",:setting_type=>"colorbox",:setting_value=>"BF2E1B")
Setting.create(:name=>"top_bar_text_color",:desc_text=>"top bar text color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"heading_font_size",:desc_text=>"heading font size",:setting_type=>"integer",:setting_value=>"30")
Setting.create(:name=>"heading_tag_font_size",:desc_text=>"heading tag font size",:setting_type=>"integer",:setting_value=>"14")
Setting.create(:name=>"heading_tag_color",:desc_text=>"heading tag color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"heading_color",:desc_text=>"heading color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"header_menu_color",:desc_text=>"header menu color",:setting_type=>"colorbox",:setting_value=>"333333")
Setting.create(:name=>"middle_color",:desc_text=>"middle color",:setting_type=>"colorbox",:setting_value=>"808080")
Setting.create(:name=>"header_logo",:desc_text=>"header logo",:setting_type=>"string",:setting_value=>"/images/rling_logo.png")
Setting.create(:name=>"edit_heading_text",:desc_text=>"changes heading text ",:setting_type=>"string",:setting_value=>"RLING CMS")
Setting.create(:name=>"edit_heading_tag_text",:desc_text=>"changes heading tag text ",:setting_type=>"string",:setting_value=>"Faster CMS for Faster Minds")
Setting.create(:name=>"top_bar_link",:desc_text=>"top_bar_link_color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"top_bar_link_hover",:desc_text=>"top bar link hover color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"middle_background_color",:desc_text=>"middle background color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"middle_text_color",:desc_text=>"middle text color",:setting_type=>"colorbox",:setting_value=>"333333")
Setting.create(:name=>"footer_text_color",:desc_text=>"footer text color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"footer_link_hover_color",:desc_text=>"footer link hover color",:setting_type=>"colorbox",:setting_value=>"BF2E1B")
Setting.create(:name=>"footer_background_color",:desc_text=>"footer link background color",:setting_type=>"colorbox",:setting_value=>"333333")
Setting.create(:name=>"header_text_hover_color",:desc_text=>"header text hover color",:setting_type=>"colorbox",:setting_value=>"FFFFFF")
Setting.create(:name=>"body_color",:desc_text=>"body color",:setting_type=>"colorbox",:setting_value=>"909090")
Setting.create(:name=>"header_menu_link_background",:desc_text=>"header menu link background",:setting_type=>"colorbox",:setting_value=>"333333")



#Create Mailer Settings
Mailer.create(:handle=>"welcome",:subject=>"Rails Party Welcome Email",:body=>"Dear Patron,


Welcome to RailsParty, your one stop testing application of RLingCMS. The following are your access details


Username/Login Name: &lt;RLING::USER::LOGIN&gt;

Password: &lt;RLING::USER::PASSWORD&gt;

We look forward to have a pleasant stay with us.

Thanks and Regards

RailsParty Team",:is_deletable=>"false",:allowable_tags=>"User")
Mailer.create(:handle=>"activation",:subject=>"You need to activate yourself to access RailsParty Website as a User",:body=>"Dear User,

You have been successfully registered into RailsParty. However in order to access the system, we need to make sure that you are the person who registered. Please click on the below activation URL or copy the url to your browser and activate.


Activation URL: &lt;RLING::USER::ACTIVATION_URL&gt;

We once again welcome you to use RailsParty, the one stop testing box for RLingCMS

Thanks and Regards
RailsParty Team",:is_deletable=>"false",:allowable_tags=>"User")
Mailer.create(:handle=>"forgot",:subject=>"Sending RailsParty Reset Password Code to reset your forgotten password",:body=>"Dear User,

You have requested to reset your password and we are herewith sending the Reset Password URL which you can use to change your password. You can click on the below url or copy the url and paste it into the browser's address bar.

RESET PASSWORD URL : &lt;RLING::USER::RESET_PASSWORD_URL&gt;

If you have not requested to reset your password, do not worry, you can still login with your old password only.

Thanks and Regards
Rails Party Team",:is_deletable=>"false",:allowable_tags=>"User")


# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Rling::Application.initialize!

 ActionMailer::Base.smtp_settings = {
   :address => "mail.heurion.com",
   :port => 25,
   :domain => "mail.heurion.com",
   :authentication => :login,
   :user_name => "ravikiran@heurion.com",
   :password => "test123"
}

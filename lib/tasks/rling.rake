namespace :rling do
  task :install => :environment do
    puts "RLING CMS Installation Procedure"
    puts "RLingCMS installation has started. It might take some time. Please be patient until it completes"
    puts ""
    puts ""
    puts ""
    puts ""
    puts "STEP 1: Installing all the gems via the bundler"
    
    Bundler.with_clean_env do
        sh "bundle install --deployment"
    end

    puts "-------------------------" 
    puts "All required gems installed. Proceed to step 2"
    puts ""
    puts ""
    puts ""
    puts ""
    puts "STEP 2: Create Database"
    puts "By default a database by name rling would be created. To change the database name go to config/database.yml and change the adapter details in the file"  
 
    Rake::Task["db:create"].invoke

    puts "-------------------------" 
    puts "Database created. Proceeding to step 3"
    puts ""
    puts ""
    puts ""
    puts ""
    puts "STEP 3: Load Database Schema"
    
    Rake::Task["db:migrate"].invoke

    puts "-------------------------"
    puts "All Tables Loaded. Proceeding to step 4"
    puts ""
    puts ""
    puts ""
    puts ""
    puts "STEP 4: Load Initial RLINGCMS Data"
    
    Rake::Task["db:seed"].invoke
    
    puts "-------------------------"
    puts "Initial data loaded."
    puts "RLingCMS is ready to use."
    puts "Run standard rails command to start your application on 3000 port"
    puts "rails s"
    puts "Access your RlingCMS on http://localhost:3000/"
    puts ""
  end
end

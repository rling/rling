Rling CMS
================================

Rling CMS is a configurable Content Managment System built on Rails 3 framework. 

Rling CMS is just not a CMS to store and retrieve information related to pages, but also includes a full fledge Management system that is required for a small scale web application.


Features of Rling CMS
-------------------------

* User and Group Management System
* Page and Menu Management System
* Dynamic Forms and Submission System
* Dynamic Model Management System
* Other Display and Grouping Systems.


Installation
-------------------------------

1.  Clone the repository:

        $ git clone git@github.com:rling/rling.git

2.  Set Database settings(Skip this, to use default settings)

   * Open rling/config/database.yml file
   * Modify adapter settings such as adapter, username, password, database, pool, etc.,
   * Save the database.yml file.

3.  Default settings are:

   * adapter: mysql
   * database: rling
   * username: root
   * password: 


4.  Run rake task to do all the necessary installations.


   * To execute and start the application in development mode use the below command

        $ rake rling:install

   * To execute and start the applicaton in production mode use the below command

        $ RAILS_ENV=production rake rling:install

5.  In both the modes, the task runs the following activities

        $ bundle install <br/>
        $ rake db:create <br/>
        $ rake db:migrate <br/>
        $ rake db:seed


6.  Running the application

        $ rails s


License
-------------------------------

Rling CMS is the brain child of SATISH N KOTA, CEO HEURION CONSULTING a.k.a 
*[Rails detectives](http://www.heurion.com).*

However Rling CMS would like to thank the following people as minimum,

   1. HEURION a.k.a RAILS DETECTIVES EMPLOYEES, EX-Employees and Project Trainees
   2. Individuals who have helped in giving us expert advise on how to make this system much better
   3. MATZ for creating Ruby Language
   4. DHH and Team for developing Rails technology.
   5. Individuals and Teams who have built CKEditor, PaperClip, RailRoady, UserStamp, Jquery, RSpec, Cucumber, Webrat, etc.,


Version
-------------------------------
*  This is the release version 1.1 of the system.
*  It runs on rails 3.2.8 and ruby 1.9.2
*  Earlier release has been moved to branch, rails3.0.x



Changes
-------------------------------

*  Added full support to rails 3.2.8
*  Usage of Assets Pipeline.
*  All the plugins have been replaced with gems.
*  It no longer uses prototype which is replaced with jquery.
*  Minor Bugfixes.
 

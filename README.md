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



Feature: Mailer Page
 
  Background:
    When I go to first user page
    And I fill in "user_login" with "amit"
    And I fill in "user_email" with "amit@heurion.com"
    And I fill in "user_password" with "test123"
    And I fill in "user_password_confirmation" with "test123"
    And I fill in "site_url" with "http://localhost:3000"
    And I press "Create Rling First User"
    Then I should be on login page
    And I fill in "login" with "amit"
    And I fill in "password" with "test123"
    And I press "Login"
    Then I should see "Login successful!" on the page

  Scenario: User on mailer index page
    Given I go to mailer index page
    Then I should see "welcome" on the mailer index page
    And I should see "Welcome Mail" on the mailer index page
    And I should see "Welcome to Rling CMS. You have been registered successfully" on the mailer index page

  Scenario: Create a new mailer page successfully
    Given I go to new mailer page
    And I fill in "mailer_handle" with "Thank you"
    And I fill in "mailer_subject" with "Thank you mail"
    And I fill in "mailer_body_editor" with "Thank you for joining us"
    When I press "Create Template"
    Then I should see "Thank you" for "Handle" on the page
    And I should see "Thank you mail" for "Subject" on the page
    And I should see "Thank you for joining us" for "Body" on the page
    And I should see "Send Mail" on the mailer index page

  Scenario: Error in Creating new Mailer( when Handle & Subject are blank )
    Given I go to the new mailer page
    When I press "Create Template"
    Then I should see "can't be blank" for "Handle" on that mailer page
    Then I should see "can't be blank" for "Subject" on that mailer page

  Scenario: Error in Creating new Mailer( when Handle is blank )
    Given I go to the new mailer page
    And I fill in "mailer_subject" with "Thank you mail"
    When I press "Create Template"
    Then I should see "can't be blank" for "Handle" on that mailer page

  Scenario: Error in Creating new Mailer( when Subject is blank )
    Given I go to the new mailer page
    And I fill in "mailer_handle" with "Thank you"
    When I press "Create Template"
    Then I should see "can't be blank" for "Subject" on that mailer page

  Scenario: User clicks on Show Page
    Given I have a mailer in mailer index page
    Given I go to mailer index page
    Then I should see "Thank you" on the mailer index page
    And I should see "Thank you mail" on the mailer index page
    And I should see "Thank you for joining us" on the mailer index page
    And I should see "Send Mail" on the mailer index page
    When I press "Show" for "Thank you" on the mailer page
    Then I should see "Thank you" for "Handle" on the mailer show page
    And I should see "Thank you mail" for "Subject" on the mailer show page
    And I should see "Thank you for joining us" for "Body" on the mailer show page

  Scenario: Edit a Mailer item
    Given I have a mailer in mailer index page
    Given I go to mailer index page 
    When I press "Edit" for "Thank you" on the mailer page
    Then I should see "Editing mailer" on the edit mailer page 
    And I fill in "mailer_handle" with "Thank you"
    And I fill in "mailer_subject" with "Thank you mail"
    And I fill in "mailer_body_editor" with "Thank you for joining us"
    When I press "Create Template"
    Then I should see "Thank you" for "Handle" on the page
    And I should see "Thank you mail" for "Subject" on the page
    And I should see "Thank you for joining us" for "Body" on the page

  Scenario: Delete an item from mailer
    Given I have a mailer in mailer index page
    Given I go to mailer index page
    Then I should see "Thank you" on the mailer index page
    When I press "Destroy" for "Thank you" on the mailer page
    Then I should not see "Thank you" on the mailer index page

  Scenario: Send Mail
     Given I have a mailer in mailer index page
     Given I go to mailer index page
     Then I press "Send Mail" for "Thank you" on the mailer page
     And I fill in "mailer_to" with "amit.mandal@gmail.com"
     And I fill in "mailer_subject" with "Thank you mail"
     And I fill in "mailer_body_editor" with "Thank you for joining us"
     When I press "Send Mail"
     Then I should see "Mail sent to given emails successfully" on the mailer index page

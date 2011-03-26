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
    When I press "Create Mailer"
    Then I should see "Thank you" for "Handle" on the page
    And I should see "Thank you mail" for "Subject" on the page
    And I should see "Thank you for joining us" for "Body" on the page
    And I should see "Send Mail" on the mailer index page

  Scenario: Error in Creating new Mailer( when Handle & Subject are blank )
    Given I go to the new mailer page
    When I press "Create Mailer"
    Then I should see "can't be blank" for "Handle" on that mailer page
    Then I should see "can't be blank" for "Subject" on that mailer page

  Scenario: Error in Creating new Mailer( when Handle is blank )
    Given I go to the new mailer page
    And I fill in "mailer_subject" with "Thank you mail"
    When I press "Create Mailer"
    Then I should see "can't be blank" for "Handle" on that mailer page

  Scenario: Error in Creating new Mailer( when Subject is blank )
    Given I go to the new mailer page
    And I fill in "mailer_handle" with "Thank you"
    When I press "Create Mailer"
    Then I should see "can't be blank" for "Subject" on that mailer page



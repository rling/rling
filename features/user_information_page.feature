Feature: User Information/Account Page
 
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

  Scenario: User on account page
    Given I go to account page
    Then I should see "amit" on the account page
    And I should see "amit@heurion.com" on the account page
    And I should see "is admin" on the account page
    And I should see "5" on the account page
    And I should see "1" on the account page
    And I should see "127.0.0.1" on the account page
    And I should see "127.0.0.1" on the account page
    And I should see "male" on the account page

  Scenario: Edit a user informatione
    Given I have a user information in user information page
    Given I go to account page 
    When I follow "Edit Information"
    Then I should see "Edit user amit " on the edit user page 
    And I fill in "user_email" with "amit@heurion.com"
    And I fill in "user_password" with "test123"
    And I fill in "user_password_confirmation" with "test123"
    And I select "Administrator" from "user_role_id"
    When I press "Update User"
    Then I should see "amit" for "Login" on the page
    And I should see "amit@heurion.com" for "Email" on the page

    

Feature: User Page
 
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

  Scenario: User on user index page
    Given I go to user index page
    Then I should see "amit" on the user index page
    And I should see "amit@heurion.com" on the user index page

  Scenario: User Details
    Given I have user details setting in user_detail_setting page
    Given I go to user index page
    When I follow "User Details"
    Then I fill in "form_field_Name" with "amit kumar mandal"
    When I press "Submit"
    Then I should see "Successfully updated" on the user index page
    And I go to account page
    And I should see "amit kumar mandal" on the account page

  Scenario: User clicks on Show Page
    Given I go to user index page
    Then I should see "amit" on the user index page
    And I follow "Show"
    Then I should see "amit" for "Login" on the page
    And I should see "amit@heurion.com" for "Email" on the page
    And I should see "is admin" for "Role" on the page
    
  Scenario: Delete an item from user
    Given I go to user index page
    Then I should see "amit" on the user index page
    And I follow "Destroy"
    Then I should not see "amit" on the user index page

  Scenario: Edit a User item
    Given I go to user index page 
    When I press "Edit" for "amit" on the user index page
    Then I should see "Edit user amit " on the edit user page 
    And I fill in "user_email" with "amit@heurion.com"
    And I fill in "user_password" with "test123"
    And I fill in "user_password_confirmation" with "test123"
    And I select "Administrator" from "user_role_id"
    When I press "Update User"
    Then I should see "amit" for "Login" on the page
    And I should see "amit@heurion.com" for "Email" on the page
    And I should see "is admin" for "Role" on the page
    

  

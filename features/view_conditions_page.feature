Feature: View Component Page
 
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

  Scenario: View conditions
    Given I have a view in view_index page
    Given I go to view_index page
    When I press "View conditions" for "Developer" on that view_index page
    Then I should see "Listing View Conditions" on that view_conditions index page

  Scenario: Create a new View Condition page successfully
    Given I have a view with model components in view_index page
    Given I go to view_index page
    Given I go to new view_conditions page
    And I select "name" from "view_condition_name"
    And I select "=" from "view_condition_operator"
    And I fill in "view_condition_value" with "amit"
    When I press "Create View condition"
    Then I should see "View condition was successfully created." on the view_conditions_index page
    And I should see "name" on that view_condition_index page
    And I should see "=" on that view_condition_index page
    And I should see "amit" on that view_condition_index page

  Scenario: Edit a view condition item
    Given I have a view_conditions in view_condition page
    Given I go to view_conditions_index page
    When I press "Edit" for "name" on the view_conditions_index page
    Then I select "name" from "view_condition_name"
    And I select "=" from "view_condition_operator"
    And I fill in "view_condition_value" with "amit"
    When I press "Update View condition"
    Then I should see "View condition was successfully updated."

  Scenario: Delete an item from model component
    Given I have a view_conditions in view_condition page
    Given I go to view_conditions_index page
    Then I should see "name" on that view_condition_index page
    When I press "Destroy" for "name" on the view_conditions_index page
    Then I should not see "name" on that view_condition_index page

  Scenario: Go to the /developer URL
    Given I have a view_components in view_component page
    Given I go to developer page
    Then I should see "Developer" on the developer page
    And I should see "amit" on that developer page

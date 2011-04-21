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

  Scenario: View components
    Given I have a view in view_index page
    Given I go to view_index page
    When I press "View Components" for "Developer" on the view index page
    Then I should see "Listing view components for Blogs " on that view_components index page

  Scenario: Create a new View Component page successfully
    Given I have a view with model components in view_index page
    Given I go to view_index page
    Given I go to new view_components page
    And I select "name" from "view_component_name"
    And I fill in "view_component_display_name" with "Name"
    And I check "view_component_is_linked"
    When I press "Add"
    Then I should see "View component was successfully created." on the view_components_index page
    And I should see "name" on that view_component_index page
    And I should see "Name" on that view_component_index page
    And I should see "true" on that view_component_index page

  Scenario: Edit a view component item
    Given I have a view_components in view_component page
    Given I go to view_components_index page
    When I press "Edit" for "name" on the view_component_index page
    Then I should see "Edit View Component name"
    And I fill in "view_component_display_name" with "Name"
    When I press "Update"
    Then I should see "View component was successfully updated."

  Scenario: Delete an item from model component
    Given I have a view_components in view_component page
    Given I go to view_components_index page
    Then I should see "name" on that view_component_index page
    When I press "Destroy" for "name" on the view_component_index page
    Then I should not see "name" on that view_component_index page

  Scenario: Go to the /developer URL
    Given I have a view_components in view_component page
    Given I go to developer page
    Then I should see "Developer" on the developer page
    And I should see "amit" on that developer page







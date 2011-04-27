Feature: Order or limit Page
 
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

  Scenario: Order or limit
    Given I have a view with model components in view_index page
    Given I go to view_index page
    When I press "Order" for "Developer" on the view_index_page
    Then I select "name" from "view_default_sort_order"
    And I select "ASC" from "view_default_sort_order_value"
    When I press "update"
    Then I should see "queries were successfully stored."

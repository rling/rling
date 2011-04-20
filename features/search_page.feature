Feature: Search Page

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

  Scenario: Search a page (When log in)
    Given I have a page item in pages page
    Then I fill in "search" with "Home"
    When I press "Search"
    Then I should see "Search Results" on the search page
    And I should see "You have 1 results for the given search query" on the search page
    And I should see "The following are the pages with the search criteria" on the search page
    And I sould see "Home" link on the search page    

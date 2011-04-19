Feature: Categoryset Page
 
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

  Scenario: Create a new menuset page successfully
    Given I go to new categoryset page
    And I fill in "categoryset_name" with "Technology"
    And I fill in "categoryset_description" with "For latest technology"
    When I press "Create Categoryset"
    Then I should see "Technology" for "Name" on the show categoryset page
    And I should see "For latest technology" for "Description" on the show categoryset page

  Scenario: User on categoryset index page
    Given I have a categoryset in categoryset index page
    Given I go to categoryset index page
    Then I should see "Technology" on the categoryset index page
    And I should see "For latest technology" on the categoryset index page

  Scenario: Error in Creating new Menuset
    Given I go to the new categoryset page
    When I press "Create Categoryset"
    Then I should see "can't be blank" for "Name" on the edit categoryset page

  Scenario: User clicks on Show Page
    Given I have a categoryset in categoryset index page
    Given I go to categoryset index page
    And I press "Show" for "Technology" on the categoryset index page
    Then I should see "Technology" for "Name" on the show categoryset page
    And I should see "For latest technology" for "Description" on the show categoryset page

  Scenario: Edit a Categoryset item
    Given I have a categoryset in categoryset index page
    Given I go to category index page 
    When I press "Edit" for "Technology" on the categoryset index page
    Then I should see "Editing Technology" on the edit categoryset page 
    And I fill in "categoryset_name" with "Technology1"
    And I fill in "categoryset_description" with "For latest technology1"
    When I press "Update Categoryset"
    Then I should see "Categoryset was successfully updated."
    Then I should see "Technology1" for "Name" on the show categoryset page
    And I should see "For latest technology1" for "Description" on the show categoryset page

  Scenario: Delete an item from menuset
    Given I have a categoryset in categoryset index page
    Given I go to categoryset index page
    Then I should see "Technology" on the categoryset index page
    When I press "Destroy" for "Technology" on the categoryset index page
    Then I should not see "Technology" on the categoryset index page












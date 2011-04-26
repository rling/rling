Feature: Menuset Page
 
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

  Scenario: User on menuset index page
    Given I go to menuset index page
    Then I should see "Header" on the index page
    And I should see "Footer" on the index page

  Scenario: Create a new menuset page successfully
    Given I go to new menuset page
    And I fill in "menuset_name" with "Header2"
    And I fill in "menuset_description" with "Header2 Menu for RlingCMS"
    When I press "Create Menuset"
    Then I should see "Menuset was successfully created."
    Then I should see "Header2" for "Name" on the page
    And I should see "Header2 Menu for RlingCMS" for "Description" on the page

  Scenario: Error in Creating new Menuset
    Given I go to the new menuset page
    When I press "Create Menuset"
    Then I should see "can't be blank" for "Name" on that menuset page
  
  Scenario: Edit a Menuset item
    Given I go to menuset index page 
    When I press "Edit" for "Header2"
    Then I should see "Edit Header2 Menuset" on the edit menuset page 
    And I fill in "menuset_name" with "Header1"
    And I fill in "menuset_description" with "Header1 Menu for RlingCMS"
    When I press "Update Menuset"
    And I should see "Menu was successfully updated."
    
  Scenario: Delete an item from menuset
    Given I go to menuset index page
    Then I should see "Header" on the index page
    And I press "Destroy" for "Header"
    Then I should not see "Header" on the index page



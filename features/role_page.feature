Feature: Role Page
 
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
#    Then I should see "Login successful!" on the page

  Scenario: User on role index page
    Given I go to role index page
    Then I should see "Anonymous" on the role index page
    And I should see "no" on the role index page
    And I should see "User" on the role index page
    And I should see "no" on the role index page
    And I should see "Administrator" on the role index page
    And I should see "no" on the role index page

  Scenario: Create a new Role page successfully
    Given I go to new role page
    And I fill in "role_role_type" with "Admin"
    When I press "Create Role"
    Then I should see "Admin" on the role index page
    Then I should see "Yes" on the role index page

  Scenario: Error in Creating new Role page
    Given I go to new role page
    When I press "Create Role"
    Then I should see "can't be blank" for "Role type" on that role page

  Scenario: Edit a role item
    Given I go to role index page 
    When I press "Edit" for "Administrator" on the role index page
    Then I should see "Editing role" on the edit role page 
    And I fill in "role_role_type" with "Administrator"
    When I press "Update Role"
    Then I should see "Role was successfully updated"

  Scenario: Delete an item from role
    Given I go to role index page
    Then I should see "Admin" on the role index page
    When I click "Delete"
    Then I should not see "Admin" on the role index page

Feature: Pages Page
 
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

  Scenario: User on pages index page
    Given I go to pages index page
    Then I should see "Services" on the pages index page
    And I should see " 	This is Heurion services" on the pages index page
    And I should see "/blog" on the pages index page
    And I should see "Yes" on the pages index page
    And I should see "Computer & mobile browsers" on the pages index page

  Scenario: Create a new Pagelet page successfully
    Given I go to new pages page
    And I fill in "page_title" with "Client"
    And I fill in "page_body_editor" with "Google"
    And I select "Computer & Mobile Browsers" from "page_page_view_type"
    When I press "Create Page"
    Then I should see "Page was successfully created."
    And I should see "Client" on the pages index page
    And I should see "Google" on the pages index page
    And I should see "/client" on the pages index page
    And I should see "No" on the pages index page
    And I should see "Computer & Mobile Browsers" on the pages index page

  Scenario: Error in Creating new Pagelet( when Title is blank )
    Given I go to the new pages page
    When I press "Create Page"
    Then I should see "can't be blank" for "Title" on that pages page
    Then I should see "Should contain a  / and alphabets and numbers and -" for "Perma link" on that pages page

  Scenario: User clicks on Show Page
    Given I go to pages index page
    Then I should see "Client" on the pages index page
    And I should see "Google" on the pages index page
    And I should see "/client" on the pages index page
    And I should see "No" on the pages index page
    And I should see "Computer & Mobile Browsers" on the pages index page
    When I click "Show"
    Then I should see "Client" on the pages show page
    And I should see "Google" on the pages show page
    And I should see "/client" on the pages show page
    And I should see "No" on the pages show page
    And I should see "Computer & Mobile Browsers" on the pages show page

#  Scenario: Edit a pages item
#    Given I go to pages index page 
#    When I click "Edit" for "Client" on the pages index page
#    Then I should see "Editing page" on the edit pages page 
#    And I fill in "page_title" with "Client"
#    And I fill in "page_body_editor" with "Google"
#    And I select "Computer & Mobile Browsers" from "page_page_view_type"
#    When I press "Update Page"
#    Then I should see "Page was successfully updated"

  Scenario: Delete an item from page
    Given I go to pages index page
    Then I should see "Client" on the pages index page
    When I click "Delete"
    Then I should not see "Client" on the pages index page

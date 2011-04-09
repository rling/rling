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


  Scenario: Create a new Pages page successfully
    Given I go to the new pages page
    And I fill in "page_title" with "Home"
    And I fill in "page_body_editor" with "This is home page"
    When I press "Create Page"
    And I should see "Home" on the pages index page
    And I should see "This is home page" on the pages index page
    And I should see "/home" on the pages index page
    And I should see "No" on the pages index page
    And I should see "No" on the pages index page

  Scenario: Error in Creating new Page( when Title is blank )
    Given I go to the new pages page
    When I press "Create Page"
    Then I should see "can't be blank" for "Title" on that pages page
    Then I should see "Perma link Should contain a / and alphabets /alpabets and numbers/ and may have - separator " on that pages page

  Scenario: User clicks on Show Page
    Given I have a page item in pages page
    Given I go to pages index page
    Then I should see "Home" on the pages index page
    And I should see "This is home page" on the pages index page
    And I should see "/home" on the pages index page
    And I should see "No" on the pages index page
    When I press "Show" for "Home" on the pages index page
    Then I should see "Home" on the pages show page
    And I should see "This is home page" on the pages show page
    And I should see "/home" on the pages show page
    And I should see "No" on the pages show page
    And I should see "No" on the pages show page

  Scenario: Edit a pages item
    Given I have a page item in pages page
    Given I go to pages index page 
    When I press "Edit" for "Home" on the pages index page
    Then I should see "Editing page" on the edit pages page 
    And I fill in "page_title" with "Home"
    And I fill in "page_body_editor" with "This is home page"
    And I select "Header" from "page_menu_parent_id"
    When I press "Update Page"
    Then I should see "Page was successfully updated"

  Scenario: Delete an item from page
    Given I have a page item in pages page
    Given I go to pages index page
    Then I should see "Client" on the pages index page
    When I press "Delete" for "Home" on the pages index page
    Then I should not see "Client" on the pages index page

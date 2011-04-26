Feature: Category View Page

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

  Scenario: User adds a new category
    Given I have a categoryset and view for category_view
    Given I go to new category_view page
    Then I fill in "category_view_title" with "List"
    And I select "TreeView" from "category_view_view_type"
    And I select "Technology" from "category_view_view_for"
    And I select "Developer" from "category_view_associated_view"
    And I fill in "category_view_body_editor" with "This is category view"
    And I select "Published" from "category_view_status"
    When I press "Create Category view"
    Then I should see "CategoryView was successfully created." on the show category_view page

  Scenario: User clicks on Show Page
    Given I have a category view in category_view index page
    Given I go to category_view_index page     
    When I press "Show" for "List" on the show category_view page
    Then I should see "List"
    Then I should see "TreeView"
    Then I should see "Technology"
    Then I should see "This is category view"
    Then I should see "list"
    Then I should see "Published"

  Scenario: Edit a category_view item
    Given I have a category view in category_view index page
    Given I go to category_view_index page     
    When I press "Edit" for "List" on the show category_view page
    Then I should see "Edit Category View: List"
    Then I fill in "category_view_title" with "List"
    And I fill in "category_view_body_editor" with "This is category view"
    And I select "Published" from "category_view_status"
    When I press "Update Category view"
    Then I should see "CategoryView was successfully updated."

#  Scenario: Delete an item from category_view
#    Given I have a category view in category_view index page
#    Given I go to category_view_index page     
#    When I press "Destroy" for "List" on the show category_view page 
#    Then I should not see "List"

  Scenario: Go to the /list URL
    Given I have a category view in category_view index page
    Given I go to list page
    Then I should see "List" on the list page
    And I should see "amit" on that developer page

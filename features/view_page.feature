Feature: View Page
 
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

  Scenario: User on View page
    Given I go to view_index page
    Then I should see "Listing Views" on the view_index page

  Scenario: Create a new view page successfully
    Given I have a object_model in object_model index page
    Given I go to new_view page
    And I fill in "view_title" with "Developer"
    And I select "Table" from "view_view_type"
    And I select "Blogs" from "view_view_for"
    And I fill in "view_per_page" with "2"
    And I fill in "view_body_editor" with "This is Developer view"
    And I select "Published" from "view_status"
    When I press "Create View"
    Then I should see "Developer" for "Title" on the show view page
    And I should see "This is Developer view" for "Body" on the show view page
    And I should see "developer" for "Perma link" on the show view page
    And I should see "No" for "Home page" on the show view page
    And I should see "Table" for "View Type" on the show view page
    And I should see "Blogs" for "View For" on the show view page
    And I should see "2" for "Per Page " on the show view page
    And I should see "No" for "Allow Create on Permission" on the show view page

  Scenario: Error in Creating new View page( when Title is blank )
    Given I have a object_model in object_model index page
    Given I go to the new_view page
    When I press "Create View"
    Then I should see "can't be blank" for "Title" on that view page
    Then I should see "Perma link Should contain a / and alphabets /alpabets and numbers/ and may have - separator " on that view page

  Scenario: User clicks on Show Page
    Given I have a view in view_index page
    Given I go to view_index page
    Then I should see "Developer" on that view_index page
    And I should see "This is Developer view" on that view_index page
    And I should see "developer" on that view_index page
    And I should see "No" on that view_index page
    And I should see "Blogs" on that view_index page
    When I press "Show" for "Developer" on the view_index page
    Then I should see "Developer" for "Title" on the show view page
    And I should see "This is Developer view" for "Body" on the show view page
    And I should see "developer" for "Perma link" on the show view page
    And I should see "No" for "Home page" on the show view page
    And I should see "Blogs" for "View For" on the show view page

  Scenario: Edit a view item
    Given I have a view in view_index page
    Given I go to view_index page 
    When I press "Edit" for "Developer" on the view_index page 
    And I fill in "view_title" with "Developer2"
    And I fill in "view_body_editor" with "This is Developer2 view"
    When I press "Update View"
    Then I should see "View was successfully updated"

  Scenario: Delete an item from View
    Given I have a view in view_index page
    Given I go to view_index page
    Then I should see "Developer" on that view_index page
    When I press "Delete" for "Developer" on the view_index page
    Then I should not see "Developer" on that view_index page


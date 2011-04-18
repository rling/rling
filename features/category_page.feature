Feature: Category Page

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
    Given I have a categoryset in categoryset index page
    Given I go to new category page
    Then I fill in "category_name" with "Ruby"
    And I select "Technology" from "category_parent_id"
    And I fill in "category_position" with "1"
    When I press "Create Category"
    Then I should see "Category was successfully created." on the show category page

  Scenario: Error in Creating new category
    Given I go to new category page
    When I press "Create Category"
    Then I should see "can't be blank" for "Name" on the edit category page

#  Scenario: User clicks on Show Page
#    Given I have a category in category index page
#    Given I go to category index page     
#    When I press "Show" for "Ruby on Rails"
#    Then I should see "Ruby on Rails" for "Name" on the show page
#    And I should see "Root" for "Parent Menu" on the show page
#    And I should see "0" for "Position" on the show page

  Scenario: Edit a Category item
    Given I have a category in category index page
    Given I go to category_index page     
    When I press "Edit" for "Ruby" on the category index page
    Then I should see "Editing category" on the edit category page 
    And I fill in "category_name" with "Ruby1"
    And I select "Technology" from "category_parent_id"
    And I fill in "category_position" with "1"
    When I press "Update Category"
    Then I should see "Category was successfully updated." on the show category page

  Scenario: Delete an item from category
    Given I have a category in category index page
    Given I go to category_index page
    Then I should see "Ruby" on the category index page
    When I press "Destroy" for "Ruby" on the category index page
    Then I should not see "Ruby" on the category index page










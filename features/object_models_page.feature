Feature: Object Model Page
 
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
    
  Scenario: Create a new object model page successfully
    Given I have a categoryset in categoryset index page
    Given I go to new object_model page
    And I fill in "object_model_name" with "Blog"
    And I fill in "object_model_description_editor" with "Blog page"
    And I check "object_model_allow_comments"
    And I select "Technology" from "object_model_categoryset_id"
    When I press "Create Object model"
    Then I should see "Object model was successfully created." on the object_model index page
    Then I should see "Blog" for "Name" on the object_model_index page
    And I should see "Blog page" for "Description" on the object_model_index page
    And I should see "blogs" for "Perma link parent" on the object_model_index page
    And I should see "Yes" for " Allow comments  " on the object_model_index page
    And I should see "No" for " Is comment Recursive ?  " on the object_model_index page
    And I should see "No" for " Email On comment ? " on the object_model_index page

  Scenario: User on Object Model index page
    Given I go to object_model index page
    Then I should see "Blog" on the object_model index page
    And I should see "Blog page" on the object_model index page
    And I should see "/blogs" on the object_model index page
    And I should see "Yes" on the object_model index page
    And I should see "No" on the object_model index page
    And I should see "No" on the object_model index page

  Scenario: Error in Creating new Pagelet( when Name is blank )
    Given I go to the new object_model page
    When I press "Create Object model"
    Then I should see "Should contain a  / and alphabets or alphabets and numbers and may contailn - separator" for "Perma link parent" on that object_model page
    Then I should see "can't be blank" for "Name" on that object_model page

  Scenario: User clicks on Show Page
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    When I press "Show" for "Blog" on the object_model index page
    Then I should see "Blog"
    And I should see "Blog page"
    And I should see "blogs"
    And I should see "Yes"

  Scenario: Edit a Object Model item
    Given I have a object_model in object_model index page
    Given I have a categoryset in categoryset index page
    Given I go to object_model index page
    When I press "Edit" for "Blog" on the object_model index page
    Then I should see "Editing Blog" on the edit object_model page 
    And I fill in "object_model_name" with "Blog"
    And I fill in "object_model_description_editor" with "Blog page"
    And I check "object_model_allow_comments"
    And I select "Technology" from "object_model_categoryset_id"
    When I press "Update Object model"
    Then I should see "Object model was successfully updated." on the object_model index page
    Then I should see "Blog" for "Name" on the object_model_index page
    And I should see "Blog page" for "Description" on the object_model_index page
    And I should see "blogs" for "Perma link parent" on the object_model_index page
    And I should see "Yes" for " Allow comments  " on the object_model_index page
    And I should see "No" for " Is comment Recursive ?  " on the object_model_index page
    And I should see "No" for " Email On comment ? " on the object_model_index page

  Scenario: Delete an item from object model
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    Then I should see "Blog" on the object_model index page
    When I press "Destroy" for "Blog" on the object_model index page
    Then I should not see "Blog" on the object_model index page

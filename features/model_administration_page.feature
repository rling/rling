Feature: Model Administration Page
 
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

  Scenario: User on Model Administration
    Given I have a object_model in object_model index page
    Given I go to admin page
    Then I should see "Blogs Administration" on the admin page
    When I follow "Blogs Administration"
    Then I am on model_submissions index page

  Scenario: Create a new Model Submission page successfully
    Given I have a model_component in model_component index page for model_submisssion
    Given I go to new model_submissions page
    Then I fill in "form_field_title" with "Information"
    And I fill in "form_field_body_editor" with "Information about the latest technology"
    And I select "Published" from "status"
    When I press "Create Blog"
    Then I should see "All details have been stored successfully" on the model_submissions index page
    And I should see "Information" on the model_submissions show page
    And I should see "Information about the latest technology" on the model_submissions show page
    And I should see "Published" on the model_submissions show page

  Scenario: User clicks on Show Page
    Given I have a model_component with model_data in model_component index page
    Given I go to model_submissions index page
    When I press "Show" for "Information" on the model_submissions index page
    Then I should see "Details of  Blog  " on the show model_submissions page

  Scenario: Edit a Model Submission item
    Given I have a model_component with model_data in model_component index page
    Given I go to model_submissions index page
    When I press "Edit" for "Information" on the model_submissions index page
    Then I should see "Edit  Blog " on the edit model_submission page 
    And I fill in "form_field_title" with "Information"
    And I fill in "form_field_body_editor" with "Information about the latest technology"
    And I fill in "form_field_name" with "amit"
    And I select "Published" from "status"
    When I press "Update Blog"
    Then I should see "Submission Form Updated" on the show model_submission page

  Scenario: Delete an item from Model Submission
    Given I have a model_component with model_data in model_component index page
    Given I go to model_submissions index page
    When I press "Destroy" for "Information" on the model_submissions index page
    Then I should not see "Information" on the model_submission index page

  Scenario: Add a category
    Given I have a model_submission with category in model_submissions index page
    Given I go to model_submissions index page
    When I press "Add Category" for "Information" on the model_submissions index page
    Then I select "Ruby" from "category"
    When I press "Add"
    Then I should see "Ruby" on the model_submissions index page

  Scenario: Show Comments
    Given I have a model_submission with comment in model_submissions index page
    Given I go to model_submissions index page
    When I press "Comments" for "Information" on the model_submissions index page
    Then I should see "Listing Comment Submissions" on the comment page
    And I should see "This is very good work by Heurion Consulting." on the show comments page


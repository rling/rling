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
    Given I have a model_component in model_component index page
    Given I go to new model_submissions page
    And I fill in "form_field_title" with "Enter The title"
    And I fill in "form_field_body_editor" with "Enter The content"
    And I fill in "form_field_name" with "amit kumar mandal"
    When I press "Create Blog"
    Then I am on model_submissions index page
    Then I should see "Enter the title" on the model_submissions index page

  Scenario: User clicks on Show Page
    Given I have a model_submission in model_submissions index page
    Given I go to model_submissions index page
    Then I should see "Enter the title" on the model_submissions index page
    When I press "Show" for "Enter The title" on the model_submissions index page
    Then I should see "/enter-the-title-0 " on the model_submissions show page
    And I should see "computer and Mobile Browsers " on the model_submissions show page
    And I should see "No" on the model_submissions show page
    And I should see "Enter the title" on the model_submissions show page
    And I should see "Enter the content" on the model_submissions show page
    And I should see "Enter the age1" on the model_submissions show page

  Scenario: Edit a Model Submission item
    Given I have a model_submission in model_submissions index page
    Given I go to model_submissions index page
    When I press "Edit" for "Enter The title" on the model_submissions index page
    Then I should see "Edit  Blog " on the edit model_submission page 
    And I fill in "form_field_title" with "Enter The title"
    And I fill in "model_submission_perma_link" with "/enter-the-title"
    And I fill in "form_field_body_editor" with "Enter The content"
    And I fill in "form_field_name" with "amit kumar mandal"
    When I press "Update Blog"
    Then I should see "Enter The title" on the model_submissions index page

  Scenario: Delete an item from Model Submission
    Given I have a model_submission in model_submissions index page
    Given I go to model_submissions index page
    Then I should see "Enter The title" on the model_submissions index page
    When I press "Destroy" for "Enter The title" on the model_submissions index page
    Then I should not see "Enter The title" on the model_submissions index page

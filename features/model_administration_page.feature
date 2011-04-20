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
    Then I fill in "form_field_title" with "Information"
    And I fill in "form_field_body_editor" with "Information about the latest technology"
    And I fill in "form_field_name" with "amit"
    And I select "Published" from "status"
    When I press "Create Blog"
    Then I should see "All details have been stored successfully" on the model_submissions index page
    Then I should see "Information" on the model_submissions show page
    Then I should see "Information about the latest technology" on the model_submissions show page
    Then I should see "amit" on the model_submissions show page
    Then I should see "Published" on the model_submissions show page




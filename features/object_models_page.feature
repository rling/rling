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

  Scenario: User on Object Model index page
    Given I go to object_model index page
    Then I should see "Blog" on the object_model index page
    And I should see "Blog page" on the object_model index page
    And I should see "/blogs" on the object_model index page
    
  Scenario: Create a new object model page successfully
    Given I go to new object_model page
    And I fill in "object_model_name" with "Blog"
    And I fill in "object_model_description_editor" with "Blog page"
    When I press "Create Object model"
    Then I should see "Blog" for "Name" on the object_model show page
    And I should see "Blog page" for "Description" on the object_model show page
    And I should see "/blogs" for "Perma link Parent" on the object_model show page

  Scenario: Error in Creating new Pagelet( when Name is blank )
    Given I go to the new object_model page
    When I press "Create Object model"
    Then I should see "Should contain a  / and alphabets or alphabets and numbers and may contailn - separator" for "Perma link parent" on that object_model page
    Then I should see "can't be blank" for "Name" on that object_model page

  Scenario: User clicks on Show Page
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    Then I should see "Blog" on the object_model index page
    And I should see "Blog page" on the object_model index page
    And I should see "/blogs" on the object_model index page
    When I press "Show" for "Blog" on the object_model index page
    Then I should see "Blog" for "Name" on the object_model show page
    And I should see "Blog page" for "Description" on the object_model show page
    And I should see "/blogs" for "Perma link Parent" on the object_model show page

  Scenario: Edit a Object Model item
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    When I press "Edit" for "Blog" on the object_model index page
    Then I should see "Editing Blog" on the edit object_model page 
    And I fill in "object_model_name" with "Blog"
    And I fill in "object_model_description_editor" with "Blog page"
    When I press "Update Object model"
    Then I should see "Blog" for "Name" on the object_model show page
    And I should see "Blog page" for "Description" on the object_model show page
    And I should see "/blogs" for "Perma link Parent" on the object_model show page

  Scenario: Delete an item from object model
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    Then I should see "Blog" on the object_model index page
    When I press "Delete" for "Blog" on the object_model index page
    Then I should not see "Blog" on the object_model index page

  Scenario: Model components
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    When I press "model Components" for "Blog" on the object_model index page
    Then I am on model_components index page
    And I should see "title" on the model_componets index page
    And I should see "Title" on the model_componets index page
    And I should see "Textfield" on the model_componets index page
    And I should see "Enter the value" on the model_componets index page
    And I should see "true" on the model_componets index page

  Scenario: Create a new Model Component page successfully
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    Given I go to new model_components page
    And I fill in "model_component_component_name" with "age"
    And I fill in "model_component_component_display_name" with "Age"
    And I select "Textfield" from "model_component_component_type"
    And I fill in "model_component_default_value" with "24"
    When I press "Create Model component"
    Then I should see "age" for "Component name" on the model_components show page
    And I should see "Age" for "Component Display name" on the model_components show page
    And I should see "Textfield" for "Component type" on the model_components show page
    And I should see "24" for "Default value" on the model_components show page
    And I should see "false" for "Mandatory" on the model_components show page
    And I should see "true" for "deletable" on the model_components show page
    When I go to admin page
    Then I should see "Blogs Administration" on the admin page

  Scenario: Error in Creating new Object Model( when Component name & Component display name are blank )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new model_components page
    When I press "Create Model component"
    Then I should see "can't be blank" for "Component name" on that model_component page
    Then I should see "is too short (minimum is 3 characters)" for "Component name" on that model_component page
    Then I should see "can't be blank" for "Component display name" on that model_component page

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
    Then I should see "/enter-the-title " on the model_submissions show page
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
    When I press "Delete" for "Enter The title" on the model_submissions index page
    Then I should not see "Enter The title" on the model_submissions index page
    
    

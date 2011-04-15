Feature:Model Component Page
 
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

  Scenario: Model components
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    When I press "Model Components" for "Blog" on the object_model index page
    Then I should see "Listing  Components for Blog " on that object_model index page
    And I should see "title" on the model_componets index page
    And I should see "Title" on the model_componets index page
    And I should see "Textfield" on the model_componets index page
    And I should see "true" on the model_componets index page

  Scenario: Create a new Model Component page successfully
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    Given I go to new model_components page
    And I fill in "model_component_component_name" with "name"
    And I fill in "model_component_component_display_name" with "Name"
    And I select "Textfield" from "model_component_component_type"
    And I check "model_component_is_mandatory"
    When I press "Create Model component"
    Then I should see "name" for "Component name" on the model_components show page
    And I should see "Name" for "Component Display name" on the model_components show page
    And I should see "Textfield" for "Component type" on the model_components show page
    And I should see "true" for "Mandatory" on the model_components show page
    And I should see "true" for "deletable" on the model_components show page
    When I go to admin page
    Then I should see "Blogs Administration" on the admin page

  Scenario: Error in Creating new Model Component( when Component name & Component display name are blank )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new model_components page
    When I press "Create Model component"
    Then I should see "can't be blank" for "Component name" on that model_component page
    And I should see "is too short (minimum is 3 characters)" for "Component name" on that model_component page
    And I should see "can't be blank" for "Component display name" on that model_component page

  Scenario: Error in Creating new Model Component( when Component name is blank )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new model_components page
    Then I fill in "model_component_component_display_name" with "Name"
    When I press "Create Model component"
    Then I should see "can't be blank" for "Component name" on that model_component page
    And I should see "is too short (minimum is 3 characters)" for "Component name" on that model_component page

  Scenario: Error in Creating new Model Component( when Component display name is blank )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new model_components page
    Then I fill in "model_component_component_name" with "name"
    When I press "Create Model component"
    Then I should see "can't be blank" for "Component display name" on that model_component page

  Scenario: Error in Creating new Comment Component( when Component name is less than 3 character )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new model_components page
    Then I fill in "model_component_component_name" with "na"
    And I fill in "model_component_component_display_name" with "Name"
    When I press "Create Model component"
    Then I should see "is too short (minimum is 3 characters)" for "Component name" on that model_component page

  Scenario: User clicks on Show Page
    Given I have a object_model with model_component in object_model index page
    Given I go to model_components_index page
    When I press "Show" for "user" on the model_components index page
    Then I should see "name" for "Component name" on the model_components show page
    And I should see "Name" for "Component Display name" on the model_components show page
    And I should see "Textfield" for "Component type" on the model_components show page
    And I should see "true" for "Mandatory" on the model_components show page
    And I should see "true" for "deletable" on the model_components show page

  Scenario: Edit a Model Component item
    Given I have a object_model with model_component in object_model index page
    Given I go to model_components_index page
    When I press "Edit" for "name" on the model_components index page
    Then I should see "Edit  Component Name  " on the edit model_component page 
    And I fill in "model_component_component_name" with "name"
    And I fill in "model_component_component_display_name" with "Name"
    And I select "Textfield" from "model_component_component_type"
    And I check "model_component_is_mandatory"
    When I press "Update Model component"
    Then I should see "Model component was successfully updated." on that model_components show page
    And I should see "name" for "Component name" on the model_components show page
    And I should see "Name" for "Component Display name" on the model_components show page
    And I should see "Textfield" for "Component type" on the model_components show page
    And I should see "true" for "Mandatory" on the model_components show page
    And I should see "true" for "deletable" on the model_components show page

  Scenario: Delete an item from model component
    Given I have a object_model with model_component in object_model index page
    Given I go to model_components_index page
    Then I should see "name" on the model_components index page
    When I press "Destroy" for "name" on the model_components index page
    Then I should not see "name" on the model_components index page

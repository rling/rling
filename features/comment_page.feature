Feature: Comment Page
 
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

  Scenario: Comment components
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    When I press "comment Components" for "Blog" on the object_model index page
    Then I should see "Listing Comment Components"
    And I should see "comment_text" on the comment_componets index page
    And I should see "Comment Text" on the comment_componets index page
    And I should see "Textarea" on the comment_componets index page
    And I should see "true" on the comment_componets index page

  Scenario: Create a new Comment Component page successfully
    Given I have a object_model in object_model index page
    Given I go to object_model index page
    Given I go to new comment_components page
    And I fill in "comment_component_component_name" with "user"
    And I fill in "comment_component_component_display_name" with "User"
    And I select "Textfield" from "comment_component_component_type"
    And I check "comment_component_mandatory"
    When I press "Create Comment component"
    Then I should see "Comment component was successfully created." on that comment_components show page
    And I should see "user"
    And I should see "User"
    And I should see "Textfield"
    And I should see "true"

  Scenario: Error in Creating new Comment Component( when Component name & Component display name are blank )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new comment_components page
    When I press "Create Comment component"
    Then I should see "is too short (minimum is 3 characters)" for "Component name" on that comment_component page
    And I should see "is invalid" for "Component name" on that comment_component page
    And I should see "can't be blank" for "Component name" on that comment_component page
    And I should see "can't be blank" for "Component display name" on that comment_component page

  Scenario: Error in Creating new Comment Component( when Component name is blank )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new comment_components page
    Then I fill in "comment_component_component_display_name" with "User"
    When I press "Create Comment component"
    Then I should see "is too short (minimum is 3 characters)" for "Component name" on that comment_component page
    And I should see "is invalid" for "Component name" on that comment_component page
    And I should see "can't be blank" for "Component name" on that comment_component page

  Scenario: Error in Creating new Comment Component( when Component Display name is blank )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new comment_components page
    Then I fill in "comment_component_component_name" with "user"
    When I press "Create Comment component"
    Then I should see "can't be blank" for "Component display name" on that comment_component page

  Scenario: Error in Creating new Comment Component( when Component name is less than 3 character )
    Given I have a object_model in object_model index page
    Given I go to object_model index page  
    Given I go to new comment_components page
    Then I fill in "comment_component_component_name" with "us"
    And I fill in "comment_component_component_display_name" with "User"
    When I press "Create Comment component"
    Then I should see "is too short (minimum is 3 characters)" for "Component name" on that comment_component page

  Scenario: User clicks on Show Page
    Given I have a object_model with comment_component in object_model index page
    Given I go to comment_components_index page
    Then I should see "user" on the comment_components index page
    And I should see "User" on the comment_components index page
    And I should see "Textfield" on the comment_components index page
    And I should see "true" on the comment_components index page
    When I press "Show" for "user" on the comment_components index page
    Then I should see "user" for "Component name" on the comment_components show page
    And I should see "User" for "Component Display name" on the comment_components show page
    And I should see "Textfield" for "Component type" on the comment_components show page
    And I should see "true" for "Mandatory" on the comment_components show page

  Scenario: Edit a Comment Component item
    Given I have a object_model with comment_component in object_model index page
    Given I go to comment_components_index page
    When I press "Edit" for "user" on the comment_components index page
    Then I should see "Editing Comment Component" on the edit comment_component page 
    And I fill in "comment_component_component_name" with "user"
    And I fill in "comment_component_component_display_name" with "User"
    And I select "Textfield" from "comment_component_component_type"
    And I check "comment_component_mandatory"
    When I press "Update Comment component"
    Then I should see "Comment component was successfully updated." on that comment_components show page
    And I should see "user"
    And I should see "User"
    And I should see "Textfield"
    And I should see "true"

  Scenario: Delete an item from comment component
    Given I have a object_model with comment_component in object_model index page
    Given I go to comment_components_index page
    Then I should see "user" on the comment_components index page
    When I press "Destroy" for "user" on the comment_components index page
    Then I should not see "user" on the comment_components index page

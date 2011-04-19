Feature: Object Form Page
 
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

  Scenario: User on object form index page
    Given I go to object_form_index page
    Then I should see "Admission" on the object_form_index page
    And I should see " 	Admission form for MCA" on the object_form_index page
    And I should see "/admission" on the object_form_index page
    And I should see "No" on the object_form_index page
    And I should see "amit@heurion.com" on the object_form_index page

  Scenario: Create a new object form page successfully
    Given I go to new object_form page
    And I fill in "object_form_title" with "Admission"
    And I fill in "object_form_body_editor" with "Admission form for MCA"
    And I fill in "object_form_email" with "amit@heurion.com"
    And I select "Published" from "object_form_status"
    When I press "Create Object form"
    Then I should see "Admission" for "Title" on the page
    And I should see "Admission form for MCA" for "Body" on the page
    And I should see "/admission" for "Perma link" on the page
    And I should see "No" for "Home page" on the page
    And I should see "amit@heurion.com" for "Email" on the page
    And I should see "Published" for "Status" on the page

  Scenario: Error in Creating new Pagelet( when Title is blank )
    Given I go to the new object_form page
    When I press "Create Object form"
    Then I should see "can't be blank" for "Title" on that pages page
    Then I should see "Perma link Should contain a / and alphabets /alpabets and numbers/ and may have - separator " on that form page

  Scenario: User clicks on Show Page
   Given I have a object_form in object_form_index page
    Given I go to object_form_index page
    When I press "Show" for "Admission" on the object_form_index page
    Then I should see "Admission" on the object_form show page
    And I should see "Admission form for MCA" on the object_form show page
    And I should see "admission" on the object_form show page
    And I should see "No" on the object_form show page
    And I should see "amit@heurion.com" on the object_form show page
    And I should see "Published" on the object_form show page

  Scenario: Edit an Object Form item
    Given I have a object_form in object_form_index page
    Given I go to object_form_index page 
    When I press "Edit" for "Admission" on the object_form_index page
    Then I should see "Editing page" on the edit pages page 
    And I fill in "object_form_title" with "Admission"
    And I fill in "object_form_body_editor" with "Admission form for MCA"
    And I fill in "object_form_email" with "amit@heurion.com"
    And I select "Published" from "object_form_status"
    When I press "Update Object form"
    Then I should see "Admission" for "Title" on the page
    And I should see "/admission" for "Perma link" on the page
    And I should see "No" for "Home page" on the page
    And I should see "amit@heurion.com" for "Email" on the page
    And I should see "Published" for "Status" on the page

  Scenario: Delete an Object Form item
    Given I have a object_form in object_form_index page
    Given I go to object_form_index page
    Then I should see "Admission" on the object_form_index page
    When I press "Destroy" for "Admission" on the object_form_index page
    Then I should not see "Admission" on the object_form_index page

  Scenario: User on Form Component page
    Given I have a object_form in object_form_index page
    Given I go to object_form_index page
    When I follow "Form Components"
    Then I should see "Listing Form Components for Admission " on the form_component_index page

  Scenario: User creates a new Form Component page successfully
    Given I have a object_form in object_form_index page
    Given I go to new form_component page
    Then I should see "New Form Component" on the new form_component page
    And I fill in "form_component_component_name" with "email"
    And I fill in "form_component_component_display_name" with "E-mail"
    And I select "Textfield" from "form_component_component_type"
    And I fill in "form_component_default_value" with "mail@mail.com"
    When I press "Create Form component"
    Then I should see "Form component was successfully created." on that form_component show page
    And I should see "email" on the form_component show page
    And I should see "E-mail" on the form_component show page
    And I should see "Textfield" on the form_component show page
    And I should see "mail@mail.com" on the form_component show page
    And I should see "false" on the form_component show page

  Scenario: Error in Creating new Form Component( when Component Name & Component Display Name are blank )
    Given I have a object_form in object_form_index page
    Given I go to new form_component page
    When I press "Create Form component"
    Then I should see "is too short (minimum is 3 characters)" for "Component name" on that mailer page
    Then I should see "is invalid" for "Component name" on the new form_component page
    Then I should see "can't be blank" for "Component name" on the new form_component page
    Then I should see "can't be blank" for "Component display name" on the new form_component page

  Scenario: Error in Creating new Form Component( when Component Display Name is blank )
    Given I have a object_form in object_form_index page
    Given I go to new form_component page
    And I fill in "form_component_component_name" with "email"
    When I press "Create Form component"
    Then I should see "can't be blank" for "Component display name" on the new form_component page

  Scenario: Error in Creating new Form Component( when Component Name is blank )
    Given I have a object_form in object_form_index page
    Given I go to new form_component page
    And I fill in "form_component_component_display_name" with "E-mail"
    When I press "Create Form component"
    Then I should see "is too short (minimum is 3 characters)" for "Component name" on that mailer page
    Then I should see "is invalid" for "Component name" on the new form_component page
    Then I should see "can't be blank" for "Component name" on the new form_component page

  Scenario: Error in Creating new Form Component( when Component Name lenght is less than 3 characters )
    Given I have a object_form in object_form_index page
    Given I go to new form_component page
    And I fill in "form_component_component_name" with "em"
    When I press "Create Form component"
    Then I should see "is too short (minimum is 3 characters)" for "Component name" on the new form_component page

  Scenario: User clicks on Show Page
    Given I have a form_component in form_componet_index page
    Given I go to form_component index page
    When I press "Show" for the "email" on the form_component_index page
    Then I should see "email" on the form_component show page
    And I should see "E-mail" on the form_component show page
    And I should see "Textfield" on the form_component show page
    And I should see "mail@mail.com" on the form_component show page
    And I should see "false" on the form_component show page

  Scenario: Edit a form_component item
    Given I have a form_component in form_componet_index page
    Given I go to form_component index page
    When I press "Edit" for the "email" on the form_component_index page
    Then I should see "Edit Form Component email" on the edit form_component page 
    And I fill in "form_component_component_name" with "email"
    And I fill in "form_component_component_display_name" with "E-mail"
    And I select "Textfield" from "form_component_component_type"
    And I fill in "form_component_default_value" with "mail@mail.com"
    When I press "Update Form component"
    Then I should see "Form component was successfully updated." on the show form_component page
    And I should see "email" on the form_component show page
    And I should see "E-mail" on the form_component show page
    And I should see "Textfield" on the form_component show page
    And I should see "mail@mail.com" on the form_component show page
    And I should see "false" on the form_component show page

  Scenario: User deletes an item from form_component
    Given I have a form_component in form_componet_index page
    Given I go to form_component index page
    Then I should see "email" on form_component index page
    When I press "Destroy" for the "email" on the form_component_index page
    Then I should not see "email" on form_component index page
  
  Scenario: User on Submissions Page
    Given I have a form_component with mandatory field in form_component page
    Given I go to object_form_index page
    When I follow "Submissions"
    Then I should see "Listing  Admissions " on the form_submissions index page

  Scenario: Edit a Submissions item
    Given I have a form_submission in form_submission page
    Given I go to form_submissions index page
    When I press "Edit" for the "amit@heurion.com" on the form_submissions index page
    Then I should see "Edit Submission " on the edit form_submission page 
    And I fill in "form_field_email" with "amit@heurion.com"
    When I press "Update"
    Then I should see "Submission Form Updated" on the form_submission index page

  Scenario: User deletes an item from form_submission page
    Given I have a form_submission in form_submission page
    Given I go to form_submissions index page
    Then I should see "amit@heurion.com" on form_submissions index page
    When I press "Destroy" for the "amit@heurion.com" on the form_submissions index page
    Then I should not see "amit@heurion.com" on form_submissions index page

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
    And I should see "Admission form for MCA" on the object_form_index page
    And I should see "/admission" on the object_form_index page
    And I should see "No" on the object_form_index page
    And I should see "amit@heurion.com" on the object_form_index page

  Scenario: Create a new object form page successfully
    Given I go to new object_form page
    And I fill in "object_form_title" with "Admission"
    And I fill in "object_form_body_editor" with "Admission form for MCA"
    And I fill in "object_form_email" with "amit@heurion.com"
    When I press "Create Object form"
    Then I should see "Admission" for "Title" on the page
    And I should see "Admission form for MCA" for "Body" on the page
    And I should see "/admission" for "Perma link" on the page
    And I should see "No" for "Home page" on the page
    And I should see "amit@heurion.com" for "Email" on the page

  Scenario: Error in Creating new Pagelet( when Title is blank )
    Given I go to the new object_form page
    When I press "Create Object form"
    Then I should see "can't be blank" for "Title" on that pages page
    Then I should see "Should contain a  / and alphabets and numbers and -" for "Perma link" on that pages page

  Scenario: User clicks on Show Page
   Given I have a object_form in object_form_index page
    Given I go to object_form_index page
    Then I should see "Admission" on the object_form_index page
    And I should see "Admission form for MCA" on the object_form_index page
    And I should see "/admission" on the object_form_index page
    And I should see "No" on the object_form_index page
    And I should see "amit@heurion.com" on the object_form_index page
    When I press "Show" for "Admission" on the object_form_index page
    Then I should see "Admission" on the object_form show page
    And I should see "Admission form for MCA" on the object_form show page
    And I should see "/admission" on the object_form show page
    And I should see "No" on the object_form show page
    And I should see "amit@heurion.com" on the object_form show page

  Scenario: Edit a Object Form item
    Given I have a object_form in object_form_index page
    Given I go to object_form_index page 
    When I press "Edit" for "Admission" on the object_form_index page
    Then I should see "Editing page" on the edit pages page 
    And I fill in "object_form_title" with "Admission"
    And I fill in "object_form_body_editor" with "Admission form for MCA"
    And I fill in "object_form_email" with "amit@heurion.com"
    When I press "Update Object form"
    Then I should see "Admission" for "Title" on the page
    And I should see "/admission" for "Perma link" on the page
    And I should see "No" for "Home page" on the page
    And I should see "amit@heurion.com" for "Email" on the page

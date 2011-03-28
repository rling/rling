Feature: User detail setting Page
 
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

  Scenario: User Detail Settings Index Page
    Given I go to user_detail_setting index page
    Then I should see "sex" on the user detail settings page
    And I should see "male,female" on the user detail settings page
    And I should see "male" on the user detail settings page
    And I should see "true" on the user detail settings page

  Scenario: Create a new User Detail Setting page successfully
    Given I go to new user_detail_setting page
    And I fill in "user_detail_setting_field_name" with "sex"
    And I select "Radiobutton" from "user_detail_setting_field_type"
    And I fill in "user_detail_setting_field_name" with "sex"
    And I fill in "user_detail_setting_field_values" with "male,female"
    And I check "user_detail_setting_mandatory"
    When I press "Create User detail setting"
    Then I should see "sex" for "Field Name" on the page
    And I should see "Radiobutton" for "Field Type" on the page
    And I should see "male,female" for "Field Values" on the page
    And I should see "male" for "Default Value" on the page
    And I should see "true" for "Is this field mandatory for users" on the page

  Scenario: Error in Creating new User_detail_setting( Field name is blank)
    Given I go to new user_detail_setting page
    When I press "Create User detail setting"
    Then I should see "can't be blank" for "Field name" on that user detail setting page

  Scenario: Error in Creating new User_detail_setting( Field name lenght is less than 3 characters )
    Given I go to new user_detail_setting page
    And I fill in "user_detail_setting_field_name" with "se"
    When I press "Create User detail setting"
    Then I should see "is too short (minimum is 3 characters)" for "Field name" on that user detail setting page

  Scenario: Error in Creating new User_detail_setting( Field name is anything than alpha)
    Given I go to new user_detail_setting page
    And I fill in "user_detail_setting_field_name" with "5lp"
    When I press "Create User detail setting"
    Then I should see "is invalid" for "Field name" on that user detail setting page

  Scenario: User clicks on Show Page
    Given I go to user_detail_setting index page
    Then I should see "sex" on the user detail settings page
    And I should see "male,female" on the user detail settings page
    And I should see "male" on the user detail settings page
    And I should see "true" on the user detail settings page
    When I click "Show"
    Then I should see "sex" for "Field Name" on the user detail setting show page
    And I should see "Radiobutton" for "Field Type" on the user detail setting show page
    And I should see "male,female" for "Field Type" on the user detail setting show page
    And I should see "male" for "Default Value" on the user detail setting show page
    And I should see "true" for "Is this field mandatory for users" on the user detail setting show page

  Scenario: Edit a User detail setting item
    Given I go to user_detail_setting index page 
    When I press "Edit" for "sex" on the user_detail_setting index page
    Then I should see "Editing user_detail_setting" on the edit user_detail_setting page 
    And I fill in "user_detail_setting_field_name" with "sex"
    And I select "Radiobutton" from "user_detail_setting_field_type"
    And I fill in "user_detail_setting_field_name" with "sex"
    And I fill in "user_detail_setting_field_values" with "male,female"
    And I check "user_detail_setting_mandatory"
    When I press "Update User detail setting"
    Then I should see "sex" for "Field Name" on the page
    And I should see "Radiobutton" for "Field Type" on the page
    And I should see "male,female" for "Field Values" on the page
    And I should see "male" for "Default Value" on the page
    And I should see "true" for "Is this field mandatory for users" on the page

  Scenario: Delete an item from user detail setting page
    Given I go to user_detail_setting index page
    Then I should see "sex" on the index page
    When I click "Delete"
    Then I should not see "sex" on the index page


Feature: Object Form Submission Page
 
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

  Scenario: Form Submission for Form Component ( When Field is not NOT MANDATORY)
    Given I have a form_component in form_component page
    Given I go to admission page
    Then I should see "Admission form for MCA" on the admission page
    And I fill in "form_field_email" with "amit@heurion.com"
    When I press "Submit"
    Then I should see "All details have been stored successfully" on that admission page

  Scenario: Form Submission for Form Component ( When Field is not MANDATORY)
    Given I have a form_component with mandatory field in form_component page
    Given I go to admission page
    Then I should see "Admission form for MCA" on the admission page
    When I press "Submit"
    Then I should see "Ensure you have added all the mandatory fields" on that admissions page


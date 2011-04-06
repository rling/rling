Feature: Setting Page
 
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

  Scenario: User on user index page
    Given I go to setting index page
    Then I should see "allow_user_register_user" on the setting index page
    And I should see "Should the System allow users to sign up to the website on their own. i.e. Should there be a sign up link for the user to execute" on the setting index page
    And I should see "boolean" on the setting index page
    And I should see "false" on the setting index page

  Scenario: Edit a Setting item
    Given I go to setting index page 
    When I press "Edit" for "allow_user_register_user" on the setting index page
    Then I should see "Editing setting" on the edit setting page 
    And I fill in "setting_setting_value" with "false"
    When I press "Update Setting"
    Then I should see "allow_user_register_user" for "Setting Name" on the page
    And I should see "Should the System allow users to sign up to the website on their own. i.e. Should there be a sign up link for the user to execute " for "Descriptive Text" on the page
    And I should see "boolean" for "Setting Type" on the page
    And I should see "false" for "Setting Value:" on the page

  Scenario: Clear Cache
    Given I go to setting index page
    When I click "Clear Cache"
    Then I am on admin page
    And I should see "Cache is empty." on the admin page

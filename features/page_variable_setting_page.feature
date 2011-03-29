Feature: Page Variable Setting Page
 
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

  Scenario: User on Page Variable Setting index page
    Given I go to page_variable_setting index page
    Then I should see "SEO Meta Keywords" on the page_variable_setting index page
    And I should see "keywords" on the page_variable_setting index page

  Scenario: Create a new Page Variable Setting page successfully
    Given I go to new page_variable_setting page
    And I fill in "page_variable_setting_name" with "SEO Meta Keywords"
    And I fill in "page_variable_setting_default_value" with "keywords"
    When I press "Create Page variable setting"
    Then I should see "Page variable setting was successfully created."
    And I should see "SEO Meta Keywords" on the pages show page
    And I should see "keywords" on the pages show page

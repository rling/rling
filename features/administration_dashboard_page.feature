Feature: Administration Dashboard Page

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

  Scenario: What should I see there
    Given I go to admin page
    Then I should see "Administration Dashboard"
    And I should see "User Management System"
    And I should see "Page Management System"
    And I should see "Models Management System"
    And I should see "Others"

  Scenario: What should I see there for User Management System
    Given I go to admin page
    Then I should see "Role Management"
    And I should see "User Administration"
    And I should see "Permission Management"

  Scenario: What should I see there for Page Management System
    Given I go to admin page
    Then I should see "Menuset Administration"
    And I should see "Menu Administration"
    And I should see "Pages Administration"
    And I should see "Pagelets Administration"
    And I should see "Forms Administration"

  Scenario: What should I see there for Models Management System
    Given I go to admin page
    Then I should see " Models Administration"
    And I should see "Views Administration"
    And I should see "CategorySet Administration"
    And I should see "Category Administration"
    And I should see "Category Views Administration"

  Scenario: What should I see there for Others
    Given I go to admin page
    Then I should see "E-mail Template Configuration"
    And I should see "Site Settings Administration"

  Scenario: If I have a Object model
    Given I have a object_model in object_model index page
    Given I go to admin page
    Then I should see "Blogs Administration"

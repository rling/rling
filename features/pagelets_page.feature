Feature: Pagelet Page
 
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

  Scenario: User on pagelet index page
    Given I go to pagelet index page
    Then I should see "Listing pagelets" on the pagelet index page
    And I should see "Home" on the pagelet index page
    And I should see "This is home menu" on the pagelet index page

  Scenario: Create a new Pagelet page successfully
    Given I go to new pagelet page
    And I fill in "pagelet_handle" with "Home"
    And I fill in "pagelet_display_text" with "This is home menu"
    When I press "Create Pagelet"
    Then I should see "Home" on the pagelet index page
    Then I should see "This is home menu" on the pagelet index page

  Scenario: Error in Creating new Pagelet( when Handle & Display text are blank )
    Given I go to the new pagelet page
    When I press "Create Pagelet"
    Then I should see "can't be blank" for "Handle" on that pagelet page
    Then I should see "can't be blank" for "Display text" on that pagelet page

  Scenario: Error in Creating new Mailer( when Handle is blank )
    Given I go to the new pagelet page
    And I fill in "pagelet_display_text" with "This is home menu"
    When I press "Create Pagelet"
    Then I should see "can't be blank" for "Handle" on that pagelet page

  Scenario: Error in Creating new Mailer( when Display text is blank )
    Given I go to the new pagelet page
    And I fill in "pagelet_handle" with "Home"
    When I press "Create Pagelet"
    Then I should see "can't be blank" for "Display text" on that pagelet page

  Scenario: User clicks on Show Page
    Given I have a pagelet in pagelet index page
    Given I go to pagelet index page
    Then I should see "Home" on the pagelet index page
    And I should see "This is home menu" on the pagelet index page
    When I press "Show" for "Home" on the pagelet index page
    Then I should see "Home" for "Handle" on the pagelet show page
    And I should see "This is home menu" for "Display text" on the pagelet show page

  Scenario: Edit a pagelet item
    Given I have a pagelet in pagelet index page
    Given I go to pagelet index page 
    When I press "Edit" for "Home" on the pagelet index page
    Then I should see "Editing pagelet" on the edit pagelet page 
    And I fill in "pagelet_handle" with "Home"
    And I fill in "pagelet_display_text" with "This is home menu"
    When I press "Update Pagelet"
    Then I should see "Home" for "Handle" on the pagelet show page
    And I should see "This is home menu" for "Display text" on the pagelet show page

  Scenario: Delete an item from pagelet
    Given I go to pagelet index page
    Then I should see "Home" on the pagelet index page
    When I click "Delete"
    Then I should not see "Home" on the pagelet index page
    
    

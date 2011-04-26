Feature: Menu Page

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

  Scenario: User on menu index page
    Given I go to menu index page
    Then I should see "Listing Menus" on that menu index page
    Then I should see "Header" on the menu index page
    And I should see "Footer" on the menu index page

  Scenario: User adds a new menu
    Given I go to the new menu page
    And I fill in "menu_name" with "Home"
    And I select "Header" from "menu_parent_id"
    And I fill in "menu_position" with "1"
    And I fill in "menu_link_path" with "http://www.heurionconsulting.com/"
    And I fill in "menu_image_path" with "/root/Desktop/cucumber/rling-gitcode/rling/public/images/rails.png"
    And I fill in "menu_hover_image_path" with "/root/Desktop/cucumber/rling-gitcode/rling/public/images/show.png"
    When I press "Create Menu"
    Then I should see "Menu was successfully created." on that menu_index page
    And I should see "Home" on the menu_index page


  Scenario: Error in Creating new menu
    Given I go to the new menu page
    When I press "Create Menu"
    Then I should see "can't be blank" for "Name" on that page

  Scenario: User clicks on Show Page
    Given I have a menu in menu index page
    Given I go to menu index page     
    Then I should see "Home" on the index page
    When I press "Show" for the "Home"
    Then I should see "Home" for "Name" on the show page
    And I should see "Root" for "Parent Menu" on the show page
    And I should see "0" for "Position" on the show page


  Scenario: Edit a Menu item
    Given I have a menu in menu index page
    Given I go to menu index page 
    When I press "Edit" for the "Home"
    Then I should see "Edit Home Menu " on the edit menu page 
    And I fill in "menu_name" with "Home"
    And I select "Header" from "menu_parent_id"
    And I fill in "menu_position" with "1"
    And I fill in "menu_link_path" with "http://www.heurionconsulting.com/"
    And I fill in "menu_image_path" with "/root/Desktop/cucumber/rling-gitcode/rling/public/images/rails.png"
    And I fill in "menu_hover_image_path" with "/root/Desktop/cucumber/rling-gitcode/rling/public/images/show.png"
    When I press "Update Menu"
    Then I should see "Menu was successfully updated." on that menu_index page
    And I should see "Home" on the menu_index page

  Scenario: Delete an item from menu
    Given I have a menu in menu index page
    Given I go to menu index page
    Then I should see "Home" on the index page
    And I press "Destroy" for the "Home"
    Then I should not see "Home" on the index page

#  Scenario: Update position
#    Given I have a menu in menu index page
#    Given I go to menu index page
#    Then I should see "0" on the menu index page
#    And I fill in "1" with "1"
#    When I press "Update Positions"
#    Then I should see "1" on the menu index page


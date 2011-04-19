Feature: Comment Submission Page
 
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

  Scenario: User on Comment Submission page
    Given I have a comment_component in comment_component page
    Given I go to Blog_comment page
    Then I should see "Information" on the comment_submission page
    And I should see "amit" on the comment_submission page
    And I should see "2011-04-19 09:26:55 UTC" on the comment_submission page

  Scenario: Add Comment
    Given I have a comment_component in comment_component page
    Given I go to Blog_comment page
    When I follow "Add Comment"
    Then I fill in "form_field_comment_text" with "This is very good work by Heurion Consulting"
    Then I fill in "form_field_user" with "amit"

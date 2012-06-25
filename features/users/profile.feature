Feature: Manage profile
  As an Authorized User I should be able to manage my account
  So I can change password or nickname

  Scenario: Change password
    Given Authorized User
    When I visit the Root page
    And I click on "Change Settings"
    And I fill in User Password with "newpassword"
    And I click on "Save"
    Then I should not have "div.errors" on the page
    When I click on "Sign Out"
    And I fill in User Email with user.email
    And I fill in User Password with "newpassword"
    And I click on "Sign in"
    Then I should be on the Root page
    

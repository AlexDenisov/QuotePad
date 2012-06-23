Feature: Reset Password
  As an Unauthorized User I should be able to reset password

  Scenario: Reset Password for Existed User
    Given Unauthorized User
    When I visit the Sign In page
    And I click on "Forgot password"
    Then I should be on the New User Password page
    When I fill in User Email with user.email
    And I click on "Reset password"
    Then I should be on the Sign In page

  Scenario: Reset Password for Nonexstied user
    When I visit the Sign In page
    And I fill in User Email with "em@ai.l"
    And I click on "Forgot password"
    Then I should be on the New User Password page

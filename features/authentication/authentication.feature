Feature: Authentication Scenario
  As a User I should be able to Sign In
  So I can see excerpts

  Scenario: Redirect Unauthorized User
    Given Unauthorized User
    When I visit the Root page
    Then I should be redirected to Sign In page

  Scenario: Authentication failed with bad data
    When I visit the Sign In page
    And I fill in User Email with "nonexistent@"em.ail"
    And I fill in User Password with "Bad Password"
    And I click on "Sign in"
    Then I should be on the Sign In page

  Scenario: Authentication failed with empty email
    Given Unauthorized User
    When I visit the Sign In page
    And I fill in User Email with ""
    And I fill in User Password with user.password
    And I click on "Sign in"
    Then I should be on the Sign In page
  
  Scenario: Authentication failed with empty password
    Given Unauthorized User
    When I visit the Sign In page
    And I fill in User Email with user.email
    And I fill in User Password with ""
    And I click on "Sign in"
    Then I should be on the Sign In page

  Scenario: Authentication failed with empty data
    Given Unauthorized User
    When I visit the Sign In page
    And I fill in User Email with ""
    And I fill in User Password with ""
    And I click on "Sign in"
    Then I should be on the Sign In page

  Scenario: Authentication successful
    Given Unauthorized User
    When I visit the Sign In page
    And I fill in User Email with user.email
    And I fill in User Password with user.password
    And I click on "Sign in"
    Then I should be redirected to Root page


Feature: Authentication Scenario
  As a User I should be able to Sign In
  So I can see excerpts

Scenario: Authentication failed
  Given Unauthorized User
  When I visit the Root page
  Then I should be redirected to Sign In page

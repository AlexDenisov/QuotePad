Feature: Create Excerpt
  As an Authorized User I should be able to Create Excerpt from Index page

  Background: Logged in User
    Given Authorized User

  Scenario: Create Excerpt successfully
    When I visit the Root page
    And I click on "New Excerpt"
    Then I should be on the New Excerpt page
    When I fill in Excerpt Content with "Test excerpt"
    And I click on "Create Excerpt"
    Then I should be on the Excerpts page

  Scenario: Create Excerpt failure
    When I visit the Root page
    And I click on "New Excerpt"
    Then I should be on the New Excerpt page
    When I click on "Create Excerpt"
    Then I should have "div.errors" on the page


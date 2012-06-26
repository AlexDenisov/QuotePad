Feature: Create Excerpt
  As an Authorized User I should be able to Create Excerpt from Index page

  Background: Logged in User
    Given Authorized User

  Scenario: Create Excerpt successfully
    When I visit the Root page
    And I click on "New Excerpt"
    Then I should be on the New Excerpt page
    When I fill in Excerpt Content with "Test excerpt"
    And I click on "Save Excerpt"
    Then I should be on the Excerpts page

  Scenario: Create Excerpt failure
    When I visit the Root page
    And I click on "New Excerpt"
    Then I should be on the New Excerpt page
    When I click on "Save Excerpt"
    Then I should have "div.errors" on the page

  Scenario: Edit excerpt
    Given the following excerpt exist:
      | Content   |
      | "Fuubar"  |
      | "Fuu bar" |
    When I visit the New Excerpt page
    And I fill in Excerpt Content with "Test_Test"
    And I click on "Save Excerpt"
    Then I should not have "div.errors" on the page
    When I visit the Root page
    Then I should see 1 Edit link under "div.excerpt"
    When I click on "Edit Excerpt"
    And I fill in Excerpt Content with "New Excerpt Content"
    And I click on "Save Excerpt"
    Then I should not have "div.errors" on the page
    And I should see "New Excerpt Content"

  Scenario: Edit excerpt failure
    When I visit the New Excerpt page
    And I fill in Excerpt Content with "Test_Test"
    And I click on "Save Excerpt"
    Then I should not have "div.errors" on the page
    When I visit the Root page
    Then I should see 1 Edit link under "div.excerpt"
    When I click on "Edit Excerpt"
    And I fill in Excerpt Content with ""
    And I click on "Save Excerpt"
    Then I should have "div.errors" on the page

  @javascript
  Scenario: Vote Up Excerpts
    Given the following excerpts exist:
      | Content  |
      | "FuuBar" |
    When I visit the Root page
    Then I should see rating 0
    When I click on "vote_up"
    Then I should see rating 1
    When I click on "vote_up"
    Then I should see rating 1
    When I click on "vote_down"
    Then I should see rating 0
    When I click on "vote_down"
    Then I should see rating -1
  

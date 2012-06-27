Feature: User Management
  As an Authorized Admin I should be able to see list of users

  Background: Authorized Admin
    Given Authorized Admin

  Scenario: Users Link
    When I visit the Root page
    Then I should see "Users"

  Scenario: Users List
    Given the following users exist:
      | Email           | Role        |
      | test1@mail.org  | Name: Admin |
      | test2@mail.org  | Name: User  |
      | test3@mail.org  | Name: User  |
      | test4@mail.org  | Name: User  |
    When I visit the Root page
    And I click on "Users"
    # four created above and I'm
    Then I should see 5 Users 

  Scenario: Create User successfully
    When I visit the New User page
    And I fill in User Email with "test@mail.org"
    And I fill in User Password with "secret"
    And I select Admin User Role Id
    And I click on "Save"
    Then I should not have "div.errors" on the page

  Scenario: Create User failure
    When I visit the New User page
    And I click on "Save"
    Then I should have "div.errors" on the page

  Scenario: Create User failure without selected Role
    When I visit the New User page
    And I fill in User Email with "test@mail.org"
    And I fill in User Password with "secret"
    And I click on "Save"
    Then I should have "div.errors" on the page
    
  Scenario: Edit User success
    Given the following users exist:
      | Email            | Role        |
      | "test1@mail.org" | Name: Admin |
      | "test2@mail.org" | Name: User  |
    When I visit the Users page
    And I click on "test1@mail.org"
    And I click on "Edit User"
    And I should see "Admin"
    When I visit the Users page

  Scenario: Delete User
    Given the following users exist:
      | Email            | Role        |
      | "test1@mail.org" | Name: Admin |
    When I visit the Users page
    Then I should see 2 Users
    And I click "Delete" under Last "div.user"
    Then I should see 1 Users

    


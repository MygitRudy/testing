@users
Feature: Abbott Users Module testing

  Background:
    Given I open the login page and I logon
    When I access to the users module

  @create_user
  Scenario: create user successfully
    Then I create user record
       | admin_users   | password |   email  |     role      |
       | testing_user  | 1111     |  a@a.com | Administrator |

  @update_user
  Scenario: update user successfully
    Then I update user record
       | admin_users    | password |   email  |     role      |
       | testing_user  | 1111     |  a@b.com | Administrator |

  @delete_user
  Scenario: delete user successfully
    Then I delete user record
       | admin_users   |
       | testing_user  |
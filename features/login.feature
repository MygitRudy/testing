@login
Feature: Abbott login testing

  Background:
    Given Abbott Login page

  @login_successfully
  Scenario: Login successfully
    When I fill in the Login form's fields
      | Email          | aa    |
      | Password       | aaaa  |
    And I click the Login button
    Then I should be redirected to the Dashboard

  @invalid_login_1
  Scenario: Error cases - missing email and password
    When I fill in the Login form's fields
      | Email          |                                 |
      | Password       |                                 |
    And I click the Login button
    Then I should see an error message

  @invalid_login_2
  Scenario: Error cases - missing password
    When I fill in the Login form's fields
      | Email          | rong.jingwen@theadventus.com    |
      | Password       |                                 |
    And I click the Login button
    Then I should see an error message

  @invalid_login_3
  Scenario: Error cases - missing email
    When I fill in the Login form's fields
       | Email          |                                |
       | Password       | vp7fykvq                       |
    And I click the Login button
    Then I should see an error message

  @invalid_login_4
  Scenario: Error cases - invalid email and password
    When I fill in the Login form's fields
       | Email          | Email         |
       | Password       | Password      |
    And I click the Login button
    Then I should see an error message
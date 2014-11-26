@forgot_password
Feature: Abbott forgot password testing

  Background:
    Given Abbott Forgot Password page

  @forgot_password
  Scenario: Forgot Password
    When I fill in the Forgot Password form's fields
      | email_address | rong.jingwen@theadventus.com   |
    And I click the Submit button
    Then I should see the message:
    """
    New Password has already sented!
    """

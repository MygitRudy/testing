@announcements
Feature: Abbott Announcements Module testing

  Background:
    Given I open the login page and I logon
    When I access to the Announcements module

  @create_announcement
  Scenario: create announcement successfully
    Then I create announcement record
       | announcement_title          | ann_excerpt |  start_date  |   end_date   | ann_content  |                
       | testing_announcement        | myexcerpt   |  03/03/2015  |  10/03/2015  |    cccc      |

  @update_announcement
  Scenario: update announcement successfully
    Then I update announcement record
       | announcement_title          | ann_excerpt |  start_date  |   end_date   | ann_content |                      
       | testing_announcement        | myexcerpt   |  03/03/2015  |  10/03/2015  |    cccc     |  

  @delete_announcement
  Scenario: delete announcement successfully
    Then I delete announcement record
       | announcement_title    |
       | testing_announcement  |
@banners
Feature: Abbott Banners Module testing

  Background:
    Given I open the login page and I logon
    When I access to the banners module

  @create_banner
  Scenario: create banner successfully
    Then I create banner record
       | banner_name     | start_date |  end_date  | image1  | image2  |  banner_link | 
       | testing_banner  | 03/01/2015 | 05/01/2015 | .jpg    | .jpg    |  uuu         |

  @update_banner
  Scenario: update banner successfully
    Then I update banner record
       | banner_name     | start_date |  end_date  | image1  | image2  |  banner_link  |
       | testing_banner  | 03/01/2015 | 05/01/2015 | .jpg    | .jpg    |  uuu          |

  @delete_banner
  Scenario: delete banner successfully
    Then I delete banner record
       | banner_name     |
       | testing_banner  |
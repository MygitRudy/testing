require_relative 'home_page'

module Abbott
  class UsersPage < WebPage

    validates :element_presence, locator: :add_user
    add_locator :add_user, '#a_adduser'


    add_link_locator          :add,                    "a_adduser"
    add_button_locator        :edit,                   "Edit"
    add_button_locator        :delete,                 "Delete"
    add_link_locator          :last,                   "Last"

    def self.open(url="#{settings.app_url}/User/List")
      super
    end

    def create_user
      log.info "Create User"
      click_link(link_locator(:add))
    end

    def update_user(params={})

      click_link(link_locator(:last))
      cnt = page.all('div#content_right tr').count - 1
      log.info cnt

      add_locator               :admin_users,            xpath: ".//div[@id='content_right']//table//tbody//tr[#{cnt}]//td[1]"

      if find(locator(:admin_users)).text == params[:admin_users]
        log.info "Update User"
        find(:xpath ,".//div[@id='content_right']//table//tbody//tr[#{cnt}]//td[2]//input[@type='button']").click
      else
        log.info "Cannot Find the Data"
        exit
      end
    end

    def delete_user(params={})

      click_link(link_locator(:last))
      cnt = page.all('div#content_right tr').count - 1
      log.info cnt

      add_locator               :admin_users,            xpath: ".//div[@id='content_right']//table//tbody//tr[#{cnt}]//td[1]"

      if find(locator(:admin_users)).text == params[:admin_users]
        log.info "Delete User"
        find(:xpath ,".//div[@id='content_right']//table//tbody//tr[#{cnt}]//td[3]//input[@type='button']").click
      else
        log.info "Cannot Find the Data"
        exit
      end
    end
  end
end
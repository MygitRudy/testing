require_relative 'home_page'

module Abbott
  class BannersPage < WebPage
    validates :element_presence, locator: :add_banner
    add_locator :add_banner, '#a_addbanner'

    add_button_locator          :add,                    "a_addbanner"
    add_button_locator          :edit,                   "Edit"
    add_button_locator          :delete,                 "Delete"
    add_locator                 :banner_name,            xpath: ".//div[@id='tab1']//table//tbody//tr[1]//td[2]"

    def self.open(url="#{settings.app_url}/Banner/List")
      super
    end

    def create_banner
      log.info "Create Banner"
      click_button(button_locator(:add))
    end

    def update_banner(params={})
      if find(locator(:banner_name)).text == params[:banner_name]
        log.info "Update Banner"
        click_button(button_locator(:edit), match: :first)
      else
        log.info "Cannot Find the Data"
        exit
      end
    end

    def delete_banner(params={})
      if find(locator(:banner_name)).text == params[:banner_name]
        log.info "Delete Banner"
        click_button(button_locator(:delete), match: :first)
      else
        log.info "Cannot Find the Data"
        exit
      end
    end
  end
end
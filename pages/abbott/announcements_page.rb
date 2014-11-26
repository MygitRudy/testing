require_relative 'home_page'

module Abbott
  class AnnouncementsPage < WebPage
    
    validates :element_presence, locator: :add_ann
    add_locator :add_ann, '#a_addannouncement'

    add_link_locator          :add,                    "+Add Announcement"
    add_button_locator        :edit,                   "Button1"
    add_button_locator        :delete,                 "Button2"
    add_locator               :announcement_title,     xpath: ".//div[@id='content_right']//table//tbody//tr[1]//td[2]"

    def self.open(url="#{settings.app_url}/Announcement/List")
      super
    end

    def create_announcement
      log.info "Create Announcement"
      click_link(link_locator(:add))
    end

    def update_announcement(params={})
      if find(locator(:announcement_title)).text == params[:announcement_title]
        log.info "Update Announcement"
        click_button(button_locator(:edit), match: :first)
      else
        log.info "Cannot Find the Data"
        exit
      end
    end

    def delete_announcement(params={})
      if find(locator(:announcement_title)).text == params[:announcement_title]
        log.info "Delete Announcement"
        click_button(button_locator(:delete), match: :first)
      else
        log.info "Cannot Find the Data"
        exit
      end
    end

  end
end
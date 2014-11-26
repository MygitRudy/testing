require_relative 'home_page'

module Abbott
  class AnnouncementCreatePage < WebPage
    validates :url, pattern: /#{settings.app_url}\/Announcement\/Add$/
    validates :title, pattern: /^Add$/

    add_field_locator       :announcement_title,     "Title"
    add_field_locator       :ann_excerpt,            "Excerpt"
    add_field_locator       :start_date,             "StartDate"
    add_field_locator       :end_date,               "EndDate"
    #add_field_locator       :ann_content,            "Content"
    add_button_locator      :save_button,            "Submit1"

    

    def self.open(url="#{settings.app_url}/Announcement/Add")
      super
    end

    def submit_announcement(params={})
      log.info "Input announcement information: #{params}"
      fill_in(field_locator(:announcement_title), with: params[:announcement_title]) if params[:announcement_title]
      fill_in(field_locator(:ann_excerpt), with: params[:ann_excerpt]) if params[:ann_excerpt]
      fill_in(field_locator(:start_date), with: params[:start_date]) if params[:start_date]
      fill_in(field_locator(:end_date), with: params[:end_date]) if params[:end_date]
      # fill_in(field_locator(:ann_content), with: params[:ann_content]) if params[:ann_content]
      # browser = page.driver.browser
      log.info evaluate_script("$(document).ready(function(){CKEDITOR.instances.Content.setData('slkdjfsdlkfj');});")
      execute_script("$(document).ready(function(){CKEDITOR.instances.Content.setData('slkdjfsdlkfj');});")
      # page.execute_script("CKEDITOR.instances.Content.setData('slkdjfsdlkfj');") #{params[:ann_content]}');console.log('#{params[:ann_content]}')")
      click_button(button_locator(:save_button))
    end
  end
end
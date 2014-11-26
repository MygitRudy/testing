require_relative 'home_page'

module Abbott
  class BannerCreatePage < WebPage
    validates :url, pattern: /#{settings.app_url}\/Banner\/Add$/
    validates :title, pattern: /^Add$/

    add_field_locator       :banner_name,            "BannerName"
    add_field_locator       :start_date,             "StartDate"
    add_field_locator       :end_date,               "EndDate"
    add_field_locator       :attach_image1,          "MobileImg"
    add_field_locator       :attach_image2,          "TabletImg"
    add_field_locator       :banner_link,            "Url"

    

    def self.open(url="#{settings.app_url}/Banner/Add")
      super
    end

    def submit_banner(params={})
      log.info "Input banner information: #{params}"
      fill_in(field_locator(:banner_name), with: params[:banner_name]) if params[:banner_name]
      fill_in(field_locator(:start_date), with: params[:start_date]) if params[:start_date]
      fill_in(field_locator(:end_date), with: params[:end_date]) if params[:end_date]
      attach_file(field_locator(:attach_image1), params[:image1]) if params[:image1]
      attach_file(field_locator(:attach_image2), params[:image2]) if params[:image2]
      fill_in(field_locator(:banner_link), with: params[:banner_link]) if params[:banner_link]
      wait_for_ajax
      first("form > table input[type='submit']").click
    end
  end
end
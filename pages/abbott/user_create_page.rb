require_relative 'home_page'

module Abbott
  class UserCreatePage < WebPage
    validates :url, pattern: /#{settings.app_url}\/User\/Add$/
    validates :title, pattern: /^Add$/

    add_field_locator         :admin_users,            "UserName"
    add_field_locator         :email,                  "Email"
    add_field_locator         :password,               "Password"
    add_button_locator        :save_button,            "Save"

    def self.open(url="#{settings.app_url}/User/Add")
      super
    end

    def submit_user(params={})
      log.info "Input user information: #{params}"
      fill_in(field_locator(:admin_users), with: params[:admin_users]) if params[:admin_users]
      fill_in(field_locator(:email), with: params[:email]) if params[:email]
      fill_in(field_locator(:password), with: params[:password]) if params[:password]
      find(:xpath, ".//select[@id='Role']//option[2]").select_option
      click_button(button_locator(:save_button))
    end
  end
end
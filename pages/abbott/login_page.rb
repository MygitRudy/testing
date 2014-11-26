require_relative 'home_page'

module Abbott
  class LoginPage < WebPage
    validates :url, pattern: /#{settings.app_url}\/User\/Login$/

    add_field_locator       :email,                "Email"
    add_field_locator       :password,             "Password"
    add_button_locator      :login_button,         "Login"
    add_locator             :error_message,        xpath: "//div[@class='validation-summary-errors']"

    def self.open(url="#{settings.app_url}/User/Login")
      super
    end

    def login(email, password)
      log.info "Fill in login form with data with user: #{email} and password #{password}"
      set_email(email)
      set_password(password)
      submit_form
      Abbott::DashboardPage.given
    end

    def set_email(email)
      fill_in(field_locator(:email), with: email)
    end

    def set_password(password)
      fill_in(field_locator(:password), with: password)
    end

    def fill_in_form(params={})
      log.info "Input login account: #{params}"
      fill_in(field_locator(:email), with: params[:email]) if params[:email]
      fill_in(field_locator(:password), with: params[:password]) if params[:password]
      wait_for_ajax
    end

    def submit_form
      log.info "Login System"
      click_button(button_locator(:login_button))
    end

    def error_message
      find(locator(:error_message))
    end
  end
end
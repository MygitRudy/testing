module Abbott
  class ForgotPasswordPage < WebPage
    validates :url, pattern: /#{settings.app_url}\/User\/ForgotPassword$/

    add_field_locator       :email_address,              'EmailAddress'
    add_button_locator      :send_button,                'Submit'

    def self.open(url="#{settings.app_url}/User/ForgotPassword")
      super
    end

    def fill_in_form(params={})
      log.info "Input email address: #{params}"
      fill_in(field_locator(:email_address), with: params[:email_address]) if params[:email_address]
    end

    def submit_form
      log.info "Send Forgot Password"
      click_button(button_locator(:send_button))
    end
  end
end
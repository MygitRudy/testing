#############################################################
#                      PREREQUISITES                        #
#############################################################
Given /^(\w+) Home page$/ do |site_name|
  if site_name == 'Abbott'
    Abbott::HomePage.open
  end
end

Given /^(\w+) Login page$/ do |site_name|
  if site_name == 'Abbott'
    Abbott::LoginPage.open
  end
end

Given /^I open the login page and I logon$/ do
  Abbott::LoginPage.open
  Abbott::LoginPage.given.login("aa", "aaaa")
  log.info "You are logged in."
end

Given /^(\w+) Forgot Password page$/ do |site_name|
  if site_name == 'Abbott'
    Abbott::ForgotPasswordPage.open
  end
end

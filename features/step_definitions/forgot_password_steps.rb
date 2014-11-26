
####################################
#              CHECK               #
####################################

When /^I fill in the Forgot Password form's fields$/ do |table_data|
  Abbott::ForgotPasswordPage.given.fill_in_form(table_data.rows_hash.symbolize_keys)
end

And /^I click the Submit button$/ do
  Abbott::ForgotPasswordPage.given.submit_form
end

Then /^I should see the message:$/ do |text|
  expect(Abbott::ForgotPasswordPage.given.text).to include(text)
end
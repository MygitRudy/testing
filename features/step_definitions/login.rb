
####################################
#              CHECK               #
####################################

When /^I fill in the Login form's fields$/ do |table_data|
  Abbott::LoginPage.given.fill_in_form(table_data.rows_hash.symbolize_keys)
end

And /^I click the Login button$/ do
  Abbott::LoginPage.given.submit_form
end

####################################
#              ACTION              #
####################################

Then /^I should see an error message$/ do
  Abbott::LoginPage.given.error_message.should be_visible
end

Then /^I should be redirected to the Dashboard$/ do
  #  Abbott::DashboardPage.wait_for_opened
end
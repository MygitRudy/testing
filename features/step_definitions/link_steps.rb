
####################################
#              CHECKS              #
####################################

Then /^I can access (\w+) WEBSITE page$/ do |site_name|
  Abbott::HomePage.open
end

Then /^I can access (\w+) CMS page$/ do |site_name|
  Abbott::LoginPage.open
end
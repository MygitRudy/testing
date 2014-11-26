
####################################
#              CHECK               #
####################################

When /^I access to the users module$/ do
  Abbott::UsersPage.open
end

####################################
#              ACTION              #
####################################

Then /^I should be redirected to users listing page$/ do
  Abbott::UsersPage.given
end

Then /^I create user record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    Abbott::UsersPage.given.create_user
    Abbott::UserCreatePage.given.submit_user(hash)
  end
end

Then /^I update user record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    Abbott::UsersPage.given.update_user(hash)
    Abbott::UserUpdatePage.given.submit_user(hash)
  end
end

Then /^I delete user record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    Abbott::UsersPage.given.delete_user(hash)
  end
end



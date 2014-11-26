
####################################
#              CHECK               #
####################################

When /^I access to the Announcements module$/ do
  Abbott::AnnouncementsPage.open
end

####################################
#              ACTION              #
####################################

Then /^I should be redirected to Announcements listing page$/ do
  Abbott::AnnouncementsPage.given
end

Then /^I create announcement record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    Abbott::AnnouncementsPage.given.create_announcement
    Abbott::AnnouncementCreatePage.given.submit_announcement(hash)
  end
end

Then /^I update announcement record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    Abbott::AnnouncementsPage.given.update_announcement(hash)
    Abbott::AnnouncementUpdatePage.given.submit_announcement(hash)
  end
end

Then /^I delete announcement record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    Abbott::AnnouncementsPage.given.delete_announcement(hash)
  end
end
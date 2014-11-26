
####################################
#              CHECK               #
####################################

When /^I access to the banners module$/ do
  Abbott::BannersPage.open
end

####################################
#              ACTION              #
####################################

Then /^I should be redirected to banners listing page$/ do
  Abbott::BannersPage.given
end

Then /^I create banner record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    hash[:image1] = File.join(File.expand_path("..", Dir.pwd), 'abp_testing_script/resources/mm' + hash[:image1]) if hash[:image1]
    hash[:image2] = File.join(File.expand_path("..", Dir.pwd), 'abp_testing_script/resources/tt' + hash[:image2]) if hash[:image2]
    Abbott::BannersPage.given.create_banner
    Abbott::BannerCreatePage.given.submit_banner(hash)
  end
end

Then /^I update banner record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    hash[:image1] = File.join(File.expand_path("..", Dir.pwd), 'abp_testing_script/resources/mm' + hash[:image1]) if hash[:image1]
    hash[:image2] = File.join(File.expand_path("..", Dir.pwd), 'abp_testing_script/resources/tt' + hash[:image2]) if hash[:image2]
    Abbott::BannersPage.given.update_banner(hash)
    Abbott::BannerUpdatePage.given.submit_banner(hash)
  end
end

Then /^I delete banner record$/ do |table_data|
  table_data.hashes.each do|hash|
    hash.symbolize_keys!
    Abbott::BannersPage.given.delete_banner(hash)
  end
end



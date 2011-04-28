Given /^I have a user detail setting on the index page$/ do
  @user_detail_setting = Factory(:user_detail_setting)
end

Then /^I should see "([^"]*)" on user detail settings page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that user detail setting page$/ do |arg1, arg2|
  page.find('ul',:text=>arg2+" "+arg1)
end

Then /^I should see "([^"]*)" on the edit user_detail_setting page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the user detail setting show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('p',:text=>arg1)
end

When /^I press "([^"]*)" for the "([^"]*)" on the page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_user_detail_setting_path(@user_detail_setting)
  elsif arg1 == "Show"
    visit user_detail_setting_path(@user_detail_setting)
  elsif arg1 == "Delete"
    visit user_detail_setting_path(@user_detail_setting)
  end
end

Then /^I should see "([^"]*)" on the user detail settings page$/ do |arg1|
  page.find('p',:text=>arg1)
end

Then /^the user detail setting position should be updated\.$/ do
  UserDetailSetting.all.each do  |user_detail_setting|
     user_detail_setting.update_attribute(:position,@user_detail_setting.id)
    end
end

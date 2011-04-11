Then /^I should see "([^"]*)" on the user index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the user index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the edit user page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

When /^I press "([^"]*)" for "([^"]*)" on the user index page$/ do |arg1, arg2|
  @user=User.find(:all)
  if arg1 == "Edit" 
    visit edit_user_path(@user)
  elsif arg1 == "Show" 
    visit user_path(@user)
  elsif arg1 == "Destroy" 
    visit user_path(@user)
  end
end

Given /^I have user details setting in user_detail_setting page$/ do
  @user_detail_settings = UserDetailSetting.create(:field_name=>"Name", :field_type=>"Textfield", :default_value=>"amit", :mandatory=>"1")
end

Then /^I should see "([^"]*)" for "([^"]*)" on the user show page$/ do |arg1, arg2|
  page.find('div',:text=>arg1)
  page.find('div',:text=>arg2)
end


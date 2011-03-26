Then /^I should see "([^"]*)" on the user detail settings page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that user detail setting page$/ do |arg1, arg2|
  page.find('ul',:text=>arg2+" "+arg1)
end

When /^I press "([^"]*)" for "([^"]*)" on the user_detail_setting index page$/ do |arg1, arg2|
  @user_detail_setting=UserDetailSetting.create
  @user_detail_setting=UserDetailSetting.find_by_field_name(arg2)
  if arg1 == "Edit" 
    visit edit_user_detail_setting_path(@user_detail_setting)
  end
end


Then /^I should see "([^"]*)" on the edit user_detail_setting page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end


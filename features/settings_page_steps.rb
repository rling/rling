Then /^I should see "([^"]*)" on the setting index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

When /^I press "([^"]*)" for "([^"]*)" on the setting index page$/ do |arg1, arg2|
  @setting=Setting.find_by_name(arg2)
  if arg1 == "Edit" 
    visit edit_setting_path(@setting)
  end
end

Then /^I should see "([^"]*)" on the edit setting page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on the page_variable_setting index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that page_variable_setting index page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Given /^I have a page_variable_setting in index page$/ do
  @page_variable_setting = Factory(:page_variable_setting)
end

When /^I press "([^"]*)" for the "([^"]*)" on the page_variable_setting page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_page_variable_setting_path(@page_variable_setting)
  elsif arg1 == "Show"
    visit page_variable_setting_path(@page_variable_setting)
  elsif arg1 == "Delete"
    visit page_variable_setting_path(@page_variable_setting)
  end
end


Then /^I should see "([^"]*)" for "([^"]*)" on the page_variable_setting show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('p',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the page_variable_setting_index page$/ do |arg1, arg2|
  page.find('th',:text=>arg2)
  page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" on the page_varible_setting index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the page_varible_setting index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end


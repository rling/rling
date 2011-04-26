Then /^I should see "([^"]*)" on the pagelet index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that pagelet page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Then /^I should see "([^"]*)" on the pagelet show page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Given /^I have a pagelet in pagelet index page$/ do
  @pagelet = Factory(:pagelet)
end

When /^I press "([^"]*)" for "([^"]*)" on the pagelet index page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_pagelet_path(@pagelet)
  elsif arg1 == "Show"
    visit pagelet_path(@pagelet)
  elsif arg1 == "Destroy"
    visit pagelet_path(@pagelet)
  end
end

Then /^I should see "([^"]*)" for "([^"]*)" on the pagelet show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on the pagelet index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the edit pagelet page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end


Then /^I should see "([^"]*)" on the pagelet index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that pagelet page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Then /^I should see "([^"]*)" on the pagelet show page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

#When /^I press "([^"]*)" for "([^"]*)" on the pagelet index page$/ do |arg1, arg2|
#  @pagelet=Pagelet.find_by_handle(arg2)
#  if arg1 == "Edit" 
#    visit edit_pagelet_path(@pagelet)
#  end
#end

#Then /^I should see "([^"]*)" on the edit pagelet page$/ do |arg1|
#  page.find("#middle").text.index(arg1).should_not eq(0)
#end

Then /^I should not see "([^"]*)" on the pagelet index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

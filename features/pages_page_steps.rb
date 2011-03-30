Then /^I should see "([^"]*)" on the pages index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that pages page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Then /^I should see "([^"]*)" on the pages show page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on the edit pages page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on the pages index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end
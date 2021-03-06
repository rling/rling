Then /^I should see "([^"]*)" on the pages index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that pages page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Given /^I have a page in page index page$/ do
  @page = Factory(:page)
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

Then /^I should see "([^"]*)" on that pages page$/ do |arg1|
  page.find('li', :text=>arg1)
end

Given /^I have a page item in pages page$/ do
  @page = Factory(:page)
end

When /^I press "([^"]*)" for "([^"]*)" on the pages index page$/ do |arg1, arg2|
  if arg1 == "Show"
    visit page_path @page
  elsif arg1 == "Edit"
    visit edit_page_path @page
  end
end

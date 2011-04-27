Then /^I should see "([^"]*)" on the role index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" on role index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that role page$/ do |arg1, arg2|
  page.find('ul',:text=>arg2+" "+arg1)
end

Given /^I have a role in role page$/ do
  @role = Factory(:role)
end

When /^I press "([^"]*)" for "([^"]*)" on the role index page$/ do |arg1, arg2|
  @role=Role.find_by_role_type(arg2)
  if arg1 == "Edit" 
    visit edit_role_path(@role)
  elsif arg1 == "Delete"
    visit role_path(@role)
  end
end

Then /^I should see "([^"]*)" on the edit role page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the role index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

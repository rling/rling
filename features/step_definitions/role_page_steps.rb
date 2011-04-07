Then /^I should see "([^"]*)" on the role index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that role page$/ do |arg1, arg2|
  page.find('ul',:text=>arg2+" "+arg1)
end

When /^I press "([^"]*)" for "([^"]*)" on the role index page$/ do |arg1, arg2|
  @role=Role.find_by_role_type(arg2)
  if arg1 == "Edit" 
    visit edit_role_path(@role)
  end
end

Then /^I should see "([^"]*)" on the edit role page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on the role index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

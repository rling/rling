Then /^I should see "([^"]*)" on the index page$/ do |arg1|
 page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the page$/ do |arg1, arg2|
  page.find('th',:text=>arg2)
  page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that menuset page$/ do |error_message, error_field|
   page.find('ul',:text=>error_field+" "+error_message)
end

When /^I press "([^"]*)" for "([^"]*)"$/ do |arg1, arg2|
  @menuset=Factory(:menuset)
  if arg1 == "Edit" 
    visit edit_menuset_path(@menuset)
  elsif arg1 == "Show"
    visit menuset_path(@menuset)
  elsif arg1 == "Destroy"
    visit menuset_path(@menuset)
  end
end

Then /^I should see "([^"]*)" on the edit menuset page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end


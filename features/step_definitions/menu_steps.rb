Then /^I should see "([^"]*)" on that menu index page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" on the menu index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" on that menu_index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on the menu_index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Given /^I have a menu in menu index page$/ do
   @menu = Factory(:menu)
 end

Then /^I should see "([^"]*)" for "([^"]*)" on the show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('p',:text=>arg1)
end

When /^I press "([^"]*)" for the "([^"]*)"$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_menu_path(@menu)
  elsif arg1 == "Show"
    visit menu_path(@menu)
  elsif arg1 == "Destroy"
    visit menu_path(@menu)
  end
end

Then /^I should see "([^"]*)" on the edit menu page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^the menu position should be updated\.$/ do
  Menu.all.each do |menu|
      menu.update_attribute(:position,@menu.id)
  end
end


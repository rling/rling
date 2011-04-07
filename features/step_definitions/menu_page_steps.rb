Then /^I should see "([^"]*)" on the show page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Given /^I have a menu in menu index page$/ do
   @menu = Menu.create(:name=>"Home",:position=>"0",:level=>1,:parent_id=>0,:menuset_id=>1,:menu_view_type=>0)
 end

Then /^I should see "([^"]*)" for "([^"]*)" on the show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end

When /^I press "([^"]*)" for the "([^"]*)"$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_menu_path(@menu)
  elsif arg1 == "Show"
    visit menu_path(@menu)
  end
end

Then /^I should see "([^"]*)" on the edit menu page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on the menu index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

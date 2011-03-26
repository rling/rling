Then /^I should see "([^"]*)" on the show page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end

When /^I press "([^"]*)" for the "([^"]*)"$/ do |arg1, arg2|
  @menuset=Menuset.create
  @menu=Menu.create(:parent_id=>@menuset.id)
 # @menu=Menu.find_by_name(arg2)
  if arg1 == "Edit" 
    visit edit_menu_path(@menu)
  end
end

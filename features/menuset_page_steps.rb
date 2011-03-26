Then /^I should see "([^"]*)" on the index page$/ do |arg1|
 page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end


When /^I press Create Menuset$/ do
  @menuset=Menuset.create
end

Then /^I should see "([^"]*)" for "([^"]*)" on that menuset page$/ do |error_message, error_field|
   page.find('ul',:text=>error_field+" "+error_message)
end

#for DELETE and EDIT

When /^I press "([^"]*)" for "([^"]*)"$/ do |arg1, arg2|
  @menuset=Menuset.find_by_name(arg2)
  if arg1 == "Edit" 
    visit edit_menuset_path(@menuset)
  end
end
Then /^I should see "([^"]*)" on the edit menuset page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on the index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end


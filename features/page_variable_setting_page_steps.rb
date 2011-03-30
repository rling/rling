Then /^I should see "([^"]*)" on the page_variable_setting index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that page_variable_setting index page$/ do |error_message, error_field|
  page.find('li',:text=>error_field+" "+error_message)
end

Given /^I have a page_variable_setting in index page$/ do
  @page_variable_setting = PageVariableSetting.create(:name=>"SEO Meta Keywords", :default_value=>"keywords")
end

When /^I press "([^"]*)" for the "([^"]*)" on the page_variable_setting page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_page_variable_setting_path(@page_variable_setting)
  elsif arg1 == "Show"
    visit page_variable_setting_path(@mailer)
  end
end


Then /^I should see "([^"]*)" for "([^"]*)" on the page_variable_setting show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end


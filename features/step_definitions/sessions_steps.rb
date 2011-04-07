Then /^I should see "([^"]*)" on the page$/ do |arg1|
  page.find('div',:text=>arg1)
end

#Then /^the "([^"]*)" should be checked$/ do |arg1|
 # response.should have_selector 'input[type=checkbox][checked=checked][value=1]'
#end

#Then /^the "([^"]*)" should be checked$/ do |arg1|
#  field = find_checkbox(arg1)
#  field.should be_checked
#end


Given /^I am logged in$/ do
  visit path_to("the login page")
  fill_in("login", :with => "amit")
  fill_in("password", :with => "test123")
  click_button("Login")
  page.find('div',:text=>"Login successful!")
end

Then /^I should see "([^"]*)" on the logout page$/ do |arg1|
  page.find('div',:text=>arg1)
end

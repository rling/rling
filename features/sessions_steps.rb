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

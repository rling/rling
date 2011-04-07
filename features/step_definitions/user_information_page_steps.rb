Then /^I should see "([^"]*)" on the account page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

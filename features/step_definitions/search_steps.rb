Then /^I should see "([^"]*)" on the search page$/ do |arg1|
  page.find('p',:text=>arg1)
end

Then /^I sould see "([^"]*)" link on the search page$/ do |arg1|
  page.find('a',:text=>arg1)
end

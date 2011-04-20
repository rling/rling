Then /^I should see "([^"]*)" on the admin page$/ do |arg1|
  page.find('a',:text=>arg1)
end

Then /^I should see "([^"]*)" on the model_submissions index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on the model_submissions show page$/ do |arg1|
  page.find('p',:text=>arg1)
end

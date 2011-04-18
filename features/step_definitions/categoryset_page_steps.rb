Then /^I should see "([^"]*)" for "([^"]*)" on the show categoryset page$/ do |arg1, arg2|
  page.find("p",:text=>arg1)
  page.find("b",:text=>arg2)
end

Given /^I have a categoryset in categoryset index page$/ do
  @categoryset = Factory(:categoryset)
end

Then /^I should see "([^"]*)" on the categoryset index page$/ do |arg1|
  page.find("td",:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the edit categoryset page$/ do |error_message, error_field|
  page.find("li", :text=>error_field +" "+error_message)
end

Given /^I press "([^"]*)" for "([^"]*)" on the categoryset index page$/ do |arg1, arg2|
  if arg1 == "Show"
    visit categoryset_path(@categoryset)
  elsif arg1 == "Edit"
    visit edit_categoryset_path(@categoryset)
  elsif arg1 == "Destroy"
    visit categoryset_path(@categoryset)
  end
end

Then /^I should see "([^"]*)" on the edit categoryset page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the categoryset index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end



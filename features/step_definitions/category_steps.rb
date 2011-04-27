Then /^I should see "([^"]*)" on the show category page$/ do |arg1|
  page.find("div",:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the edit category page$/ do |error_message, error_field|
  page.find("li", :text=>error_field +" "+error_message)
end

Given /^I have a category in category index page$/ do
  @categoryset = Factory(:categoryset)
  @category = Factory(:category, :categoryset_id=>@categoryset.id)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the show category page$/ do |arg1, arg2|
  page.find("p",:text=>arg1)
  page.find("b",:text=>arg2)
end

When /^I press "([^"]*)" for "([^"]*)" on the category index page$/ do |arg1, arg2|
  if arg1 == "Show"
    visit category_path(@category)
  elsif arg1 == "Edit"
    visit edit_category_path(@category)
  elsif arg1 == "Destroy"
    visit category_path(@category)
  end
end

Then /^I should see "([^"]*)" on the edit category page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on the category index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the category index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

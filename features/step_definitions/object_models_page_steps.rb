Then /^I should see "([^"]*)" on the object_model index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end


Then /^I should see "([^"]*)" for "([^"]*)" on the object_model show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that object_model page$/ do |error_message, error_field|
  page.find('ul',:text=>error_field+" "+error_message)
end

Given /^I have a object_model in object_model index page$/ do
  @object_model = Factory(:object_model)
end

When /^I press "([^"]*)" for "([^"]*)" on the object_model index page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_object_model_path(@object_model)
  elsif arg1 == "Show"
    visit object_model_path(@object_model)
  elsif arg1 == "Destroy"
    visit object_model_path(@object_model)
  elsif arg1 == "Model Components"
    visit object_model_model_components_path(@object_model)
  elsif arg1 == "comment Components"
    visit object_model_comment_components_path(@object_model)
  end
end

Then /^I should see "([^"]*)" on the edit object_model page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on the object_model index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on that object_model index page$/ do |arg1|
  page.find('h1',:text=>arg1)
end


Then /^I should see "([^"]*)" on that comment_components show page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the comment_components show page$/ do |arg1, arg2|
  page.find('p',:text=>arg1)
  page.find('b',:text=>arg2)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that comment_component page$/ do |error_message, error_field|
  page.find('ul',:text=>error_field+" "+error_message)
end

Given /^I have a object_model with comment_component in object_model index page$/ do
  @object_model = Factory(:object_model)
  @comment_component = Factory(:comment_component, :object_model_id=>@object_model.id)
end

Then /^I should see "([^"]*)" on the comment_components index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

When /^I press "([^"]*)" for "([^"]*)" on the comment_components index page$/ do |arg1, arg2|
  if arg1 == "Show" 
    visit object_model_comment_component_path(@object_model, @comment_component)
  elsif arg1 == "Edit"
    visit edit_object_model_comment_component_path(@object_model, @comment_component)
  elsif arg1 == "Destroy"
    visit object_model_comment_component_path(@object_model, @comment_component)
  end
end

Then /^I should see "([^"]*)" on the edit comment_component page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the comment_components index page$/ do |arg1|
  page.find('#middle').text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the comment_componets index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

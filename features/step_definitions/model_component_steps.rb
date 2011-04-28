Given /^I have a object_model with model_component in object_model index page$/ do
  @object_model = Factory(:object_model)
  @model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"0",:is_mandatory=>"0")
end

When /^I press "([^"]*)" for "([^"]*)" on the model_components index page$/ do |arg1, arg2|
  if arg1 == "Show" 
    visit object_model_model_component_path(@object_model, @model_component)
  elsif arg1 == "Edit" 
    visit edit_object_model_model_component_path(@object_model, @model_component)
  elsif arg1 == "Destroy" 
    visit object_model_model_component_path(@object_model, @model_component)
  end
end

Then /^I should see "([^"]*)" on the edit model_component page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" on that model_components show page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on the model_components index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the model_components index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the model_componets index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the model_components index page$/ do |arg1, arg2|
  page.find('td',:text=>arg1)
  page.find('th',:text=>arg2)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that model_component page$/ do |arg1, arg2|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Given /^I have a model_component in model_component index page$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"title",:component_display_name=>"Title",:component_type=>"Textfield",:default_value=>"Enter a title",:is_deletable=>"0",:is_mandatory=>"1")
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"0",:is_mandatory=>"0")
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"body",:component_display_name=>"Body",:component_type=>"RichtextEditor",:default_value=>"Enter a Content",:is_deletable=>"1",:is_mandatory=>"1")
 end

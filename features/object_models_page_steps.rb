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
  @object_model = ObjectModel.create(:name=>"name", :perma_link_parent=>"/blogs", :description=>"Blog page")
end

When /^I press "([^"]*)" for "([^"]*)" on the object_model index page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_object_model_path(@object_model)
  elsif arg1 == "Show"
    visit object_model_path(@object_model)
  elsif arg1 == "Delete"
    visit object_model_path(@object_model)
  end
end

Then /^I should see "([^"]*)" on the edit object_model page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on the object_model index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the model_componets index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end


Then /^I should see "([^"]*)" for "([^"]*)" on the model_components show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that model_component page$/ do |arg1, arg2|
  page.find('#middle').text.index(arg1).should_not eq(0)
end
#Given /^I have a model_components in model_components index page$/ do
 # @model_comp = ModelComponent.create(:object_model_id=>"2", :component_name=>"age", :component_display_name=>"Age", :component_type=>"Textfield", :default_value=>"Enter the age", :is_mandatory=>"0", :is_deletable=>"1")
#end


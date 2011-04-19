Then /^I should see "([^"]*)" on the admin page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on the model_submissions index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Given /^I have a model_submission in model_submissions index page$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"title",:is_mandatory=>"1")
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:is_mandatory=>"0")
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"body",:is_mandatory=>"1")
  @model_submission = Factory(:model_submission, :object_model_id=>@object_model.id)
  @model_data=Factory(:model_data, :model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id)
end

When /^I press "([^"]*)" for "([^"]*)" on the model_submissions index page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "Show"
    visit object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "Destroy"
    visit object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "Add"
    visit add_category_object_model_model_submission_path(@object_model,@model_data)
  end
end

Then /^I should see "([^"]*)" on the model_submissions show page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on the edit model_submission page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the model_submissions index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Given /^I have a model_submission with category in model_submissions index page$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"title",:is_mandatory=>"1")
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:is_mandatory=>"0")
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"body",:is_mandatory=>"1")
  @model_submission = Factory(:model_submission, :object_model_id=>@object_model.id)
  @model_data=Factory(:model_data, :model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id)
  @categoryset = Factory(:categoryset)
  @category = Factory(:category, :categoryset_id=>@categoryset.id)
#  @categorizations = Factory(:categorization, :model_submission_id=>@model_submission.id, :category_id=>@category.id)
end

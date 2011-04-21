Then /^I should see "([^"]*)" on the admin page$/ do |arg1|
  page.find('a',:text=>arg1)
end

Then /^I should see "([^"]*)" on the model_submissions index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Given /^I have a model_component in model_component index page for model_submisssion$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"0",:is_mandatory=>"0")
end

Then /^I should see "([^"]*)" on the model_submissions show page$/ do |arg1|
  page.find('p',:text=>arg1)
end

Given /^I have a model_component with model_data in model_component index page$/ do
  @object_model = Factory(:object_model)
  @model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"title",:component_display_name=>"Title",:component_type=>"Textfield",:is_deletable=>"0",:is_mandatory=>"1")
  @model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"0",:is_mandatory=>"0")
  @model_submission = Factory(:model_submission, :object_model_id=>@object_model.id)
  @model_data=Factory(:model_data, :model_component_id=>@model_component.id,:model_submission_id=>@model_submission.id, :data_value=>"Information")
end

When /^I press "([^"]*)" for "([^"]*)" on the model_submissions index page$/ do |arg1, arg2|
  if arg1 == "Show"
    visit object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "Edit"
    visit edit_object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "Destroy"
    visit object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "Add Category"
    visit add_category_object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "X"
    visit category_remove_object_model_model_submission_path(@object_model,@model_data,@category)
  elsif arg1 == "Comments"
    visit object_model_model_submission_comment_submissions_path(@object_model,@model_data)
  end
end

Then /^I should see "([^"]*)" on the show model_submissions page$/ do |arg1|
  page.find('h3',:text=>arg1)
end

Then /^I should see "([^"]*)" on the edit model_submission page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" on the show model_submission page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should not see "([^"]*)" on the model_submission index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Given /^I have a model_submission with category in model_submissions index page$/ do
  @categoryset = Factory(:categoryset)
  @category = Factory(:category, :categoryset_id=>@categoryset.id)
  @object_model = Factory(:object_model, :categoryset_id=>@categoryset.id)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"1",:is_mandatory=>"1")
  @model_submission = Factory(:model_submission, :object_model_id=>@object_model.id)
  @model_data=Factory(:model_data, :model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id, :data_value=>"Information")
end

Then /^I should see "([^"]*)" on the model_submission index page$/ do |arg1|
  page.find('td',:text=>arg1)
end


Given /^I have a model_submission with comment in model_submissions index page$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"title",:component_display_name=>"Title",:component_type=>"Textfield",:is_deletable=>"0",:is_mandatory=>"1")
  @model_submission = Factory(:model_submission, :object_model_id=>@object_model.id)
  @model_data=Factory(:model_data, :model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id)
  @comment_component = Factory(:comment_component, :object_model_id=>@object_model.id)
  @cooment_submission = Factory(:comment_submission, :model_submission_id=>@model_submission.id)
  @comment_data = Factory(:comment_data, :comment_component_id=>@comment_component.id,:comment_submission_id=>@cooment_submission.id, :data_value=>"This is very good work by Heurion Consulting.")
end

Then /^I should see "([^"]*)" on the comment page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" on the show comments page$/ do |arg1|
  page.find('td',:text=>arg1)
end

#Given /^I have a model_submission with categorization in model_submissions index page$/ do
#  @categoryset = Factory(:categoryset)
#  @category = Factory(:category, :categoryset_id=>@categoryset.id)
#  @object_model = Factory(:object_model, :categoryset_id=>@categoryset.id)
#  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"1",:is_mandatory=>"1")
#  @model_submission = Factory(:model_submission, :object_model_id=>@object_model.id)
#  @model_data=Factory(:model_data, :model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id, :data_value=>"Information")
#  @categorization = Factory(:categorization, :model_submission_id=>@model_submission.id, :category_id=>@category.id)
#end






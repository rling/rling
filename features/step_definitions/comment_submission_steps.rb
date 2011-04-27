Given /^I have a comment_component in comment_component page$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"0",:is_mandatory=>"0")
  @model_submission = Factory(:model_submission, :object_model_id=>@object_model.id)
  @model_data=Factory(:model_data, :model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id, :data_value=>"Information")
  @model_data=Factory(:model_data, :model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id, :data_value=>"Information about the latest technology")
  @model_data=Factory(:model_data, :model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id)
  @comment_component = Factory(:comment_component, :object_model_id=>@object_model.id)
end

Then /^I should see "([^"]*)" on the comment_submission page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on that comment_submission page$/ do |arg1|
  page.find('p',:text=>arg1)
end

Then /^I should see "([^"]*)" on the Blog_comment page$/ do |arg1|
  page.find('div',:text=>arg1)
end

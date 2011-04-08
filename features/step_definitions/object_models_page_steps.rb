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
  @object_model = ObjectModel.create(:name=>"Blog", :perma_link_parent=>"/blogs", :description=>"Blog page")
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

Given /^I have a model_component in model_component index page$/ do
  @object_model = ObjectModel.create(:name=>"Blog", :perma_link_parent=>"/blogs", :description=>"Blog page")
  @object_model_component = @object_model.model_components.create(:component_name=>"title", :component_display_name=>"Title", :component_type=>"Textfield", :default_value=>"Enter The title", :is_mandatory=>"1", :is_deletable=>"0", :position=>"0")
  @object_model_component = @object_model.model_components.create(:component_name=>"body", :component_display_name=>"Body", :component_type=>"cktext_area", :default_value=>"Enter The content", :is_mandatory=>"0", :is_deletable=>"0", :position=>"0")
  @object_model_component = @object_model.model_components.create(:component_name=>"name", :component_display_name=>"name", :component_type=>"Textfield", :is_mandatory=>"1", :is_deletable=>"1", :position=>"0")
end

Then /^I should see "([^"]*)" on the admin page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on the model_submissions index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Given /^I have a model_submission in model_submissions index page$/ do
  @object_model = ObjectModel.create(:name=>"Blog", :perma_link_parent=>"/blogs", :description=>"Blog page")
  @object_model_component = @object_model.model_components.create(:component_name=>"title", :component_display_name=>"Title", :component_type=>"Textfield", :default_value=>"Enter The title", :is_mandatory=>"1", :is_deletable=>"0", :position=>"0")
  @object_model_component = @object_model.model_components.create(:component_name=>"body", :component_display_name=>"Body", :component_type=>"cktext_area", :default_value=>"Enter The content", :is_mandatory=>"0", :is_deletable=>"0", :position=>"0")
  @object_model_component = @object_model.model_components.create(:component_name=>"name", :component_display_name=>"name", :component_type=>"Textfield", :is_mandatory=>"1", :is_deletable=>"1", :position=>"0")
  @model_submission = @object_model.model_submissions.create(:object_model_id=>@object_model.id,:perma_link=>"/enter-the-title", :home_page=>"0", :page_view_type=>"0",:creator_id=>"1", :updater_id=>"1")
  @model_data=@model_submission.model_datas.create(:model_submission_id=>@model_submission.id,:model_component_id=>@object_model_component.id,:data_value=>"Enter The title")
end

When /^I press "([^"]*)" for "([^"]*)" on the model_submissions index page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "Show"
    visit object_model_model_submission_path(@object_model,@model_data)
  elsif arg1 == "Delete"
    visit object_model_model_submission_path(@object_model,@model_data)
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






When /^I press "([^"]*)" for "([^"]*)" on the view index page$/ do |arg1, arg2|
  if arg1 == "View Components"
    visit view_view_components_path(@view)
  end
end

Then /^I should see "([^"]*)" on that view_components index page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Given /^I have a view with model components in view_index page$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"1",:is_mandatory=>"0")
  @view = Factory(:view, :view_for=>@object_model.id)
end

Then /^I should see "([^"]*)" on the view_components_index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on that view_component_index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Given /^I have a view_components in view_component page$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"1",:is_mandatory=>"0")
  @view = Factory(:view, :view_for=>@object_model.id)
  @view_component = Factory(:view_component, :view_id=>@view.id)
end

When /^I press "([^"]*)" for "([^"]*)" on the view_component_index page$/ do |arg1, arg2|
  if arg1 == "Edit"
    visit edit_view_view_component_path(@view, @view_component)
  elsif arg1 == "Destroy"
    visit view_view_component_path(@view, @view_component)
  end
end

Then /^I should not see "([^"]*)" on that view_component_index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the developer page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on that developer page$/ do |arg1|
  page.find('a',:text=>arg1)
end








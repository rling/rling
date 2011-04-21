When /^I press "([^"]*)" for "([^"]*)" on that view_index page$/ do |arg1, arg2|
  if arg1 == "View conditions"
    visit view_view_conditions_path(@view)
  end
end

Then /^I should see "([^"]*)" on that view_conditions index page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" on the view_conditions_index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on that view_condition_index page$/ do |arg1|
  page.find('td',:text=>arg1)
end

Given /^I have a view_conditions in view_condition page$/ do
  @object_model = Factory(:object_model)
  @object_model_component = Factory(:model_component, :object_model_id=>@object_model.id, :component_name=>"name",:component_display_name=>"Name",:component_type=>"Textfield",:is_deletable=>"1",:is_mandatory=>"0")
  @view = Factory(:view, :view_for=>@object_model.id)
  @view_condition = Factory(:view_condition, :view_id=>@view.id)
end

When /^I press "([^"]*)" for "([^"]*)" on the view_conditions_index page$/ do |arg1, arg2|
  if arg1 == "Edit"
    visit edit_view_view_condition_path(@view, @view_condition)
  elsif arg1 == "Destroy"
    visit view_view_condition_path(@view, @view_condition)
  end
end

Then /^I should not see "([^"]*)" on that view_condition_index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end



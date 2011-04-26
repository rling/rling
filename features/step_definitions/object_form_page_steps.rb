Then /^I should see "([^"]*)" on the object_form_index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Given /^I have a object_form in object_form_index page$/ do
  @object=Factory(:object_form)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the Object_form index page$/ do |arg1, arg2|
  page.find('p',:text=>arg1)
  page.find('b',:text=>arg2)
end

Then /^I should see "([^"]*)" on the show Object_form page$/ do |arg1|
  page.find('div',:text=>arg1)
end

When /^I press "([^"]*)" for "([^"]*)" on the object_form_index page$/ do |arg1, arg2|
  
  if arg1 == "Edit" 
    visit edit_page_path(@object)
  elsif arg1 == "Show"
    visit page_path(@object)
  end
end

Then /^I should see "([^"]*)" on the object_form show page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on that form page$/ do |arg1|
  page.find('li', :text=>arg1)
end

Then /^I should not see "([^"]*)" on the object_form_index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the form_component_index page$/ do |arg1|
  page.find('h1', :text=>arg1)
end

Then /^I should see "([^"]*)" on the new form_component page$/ do |arg1|
  page.find('h1', :text=>arg1)
end

Then /^I should see "([^"]*)" on that form_components_index page$/ do |arg1|
  page.find('div', :text=>arg1)
end

Then /^I should see "([^"]*)" on the form_component show page$/ do |arg1|
  page.find('p', :text=>arg1)
end

Then /^I should see "([^"]*)" on the form_components_index page$/ do |arg1|
  page.find('td', :text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the new form_component page$/ do |error_massage, error_field|
  page.find('ul',:text=>error_field+" "+error_massage)
end

Given /^I have a form_component in form_componet_index page$/ do
  @object=Factory(:object_form)
  @form_component = Factory(:form_component, :object_form_id=>@object.id, :default_value=>"mail@mail.com")
end

When /^I press "([^"]*)" for the "([^"]*)" on the form_component_index page$/ do |arg1, arg2|
  if arg1 == "Show"
    visit object_form_form_component_path(@object,@form_component)
  elsif arg1 == "Edit"
    visit edit_object_form_form_component_path(@object,@form_component)
  elsif arg1 == "Destroy"
    visit object_form_form_component_path(@object,@form_component)
  end
end

Then /^I should see "([^"]*)" on form_component index page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on form_component index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the edit form_component page$/ do |arg1|
  page.find('h1', :text=>arg1)
end

Then /^I should see "([^"]*)" on the show form_component page$/ do |arg1|
  page.find('div', :text=>arg1)
end

Then /^I should see "([^"]*)" on the form_submissions index page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Given /^I have a form_submission in form_submission page$/ do
  @object=Factory(:object_form)
  @form_component = Factory(:form_component, :object_form_id=>@object.id)
  @form_submission = Factory(:form_submission, :object_form_id=>@object.id)
  @form_data = Factory(:form_data, :form_component_id=>@form_component.id, :form_submission_id=>@form_submission.id)
end

When /^I press "([^"]*)" for the "([^"]*)" on the form_submissions index page$/ do |arg1, arg2|
  if arg1 == "Edit"
    visit edit_object_form_form_submission_path(@object,@form_submission)
  elsif arg1 == "Destroy"
    visit object_form_form_submission_path(@object,@form_submission)
  end
end

Then /^I should see "([^"]*)" on the edit form_submission page$/ do |arg1|
  page.find('h1',:text=>arg1)
end

Then /^I should see "([^"]*)" on the form_submission index page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on form_submissions index page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on form_submissions index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

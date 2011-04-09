Then /^I should see "([^"]*)" on the object_form_index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Given /^I have a object_form in object_form_index page$/ do
  @object=ObjectForm.create(:title=>"Admission", :body=>"Admission form for MCA", :perma_link=>"/admission", :home_page=>"0", :email=>"amit@heurion.com")
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

Then /^I should see "([^"]*)" on that form_component show page$/ do |arg1|
  page.find('div', :text=>arg1)
end

Then /^I should see "([^"]*)" on the form_component show page$/ do |arg1|
  page.find('p', :text=>arg1)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the new form_component page$/ do |error_massage, error_field|
  page.find('ul',:text=>error_field+" "+error_massage)
end

Given /^I have a form_component in form_componet_index page$/ do
  @object=ObjectForm.create(:title=>"Admission", :body=>"Admission form for MCA", :perma_link=>"/admission", :home_page=>"0", :email=>"amit@heurion.com")
  @form_component = @object.form_components.create(:object_form_id=>@object.id, :component_name=>"email", :component_display_name=>"E-mail", :component_type=>"Textfield", :default_value=>"mail@mail.com", :mandatory=>"0", :position=>"0")
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
  @object=ObjectForm.create(:title=>"Admission", :body=>"Admission form for MCA", :perma_link=>"/admission", :home_page=>"0", :email=>"amit@heurion.com")
  @form_component = @object.form_components.create(:object_form_id=>@object.id, :component_name=>"email", :component_display_name=>"E-mail", :component_type=>"Textfield", :mandatory=>"1", :position=>"0")
  @form_submission = FormSubmission.create(:object_form_id=>@object.id)
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

Given /^I have a form_component in form_component page$/ do
  @object=Factory(:object_form)
  @form_component = Factory(:form_component, :object_form_id=>@object.id, :default_value=>"mail@mail.com", :mandatory=>"0")
 # @form_data = Factory(:form_data, :form_component_id=>@form_component.id)
end

Then /^I should see "([^"]*)" on the admission page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on that admission page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Given /^I have a form_component with mandatory field in form_component page$/ do
  @object=Factory(:object_form)
  @form_component = Factory(:form_component, :object_form_id=>@object.id, :mandatory=>"1")
end

Then /^I should see "([^"]*)" on that admissions page$/ do |arg1|
  page.find('div',:text=>arg1)
end

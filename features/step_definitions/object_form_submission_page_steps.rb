Given /^I have a form_component in form_component page$/ do
  @object=ObjectForm.create(:title=>"Admission", :body=>"Admission form for MCA", :perma_link=>"/admission", :home_page=>"0", :email=>"amit@heurion.com")
  @form_component = @object.form_components.create(:object_form_id=>@object.id, :component_name=>"email", :component_display_name=>"E-mail", :component_type=>"Textfield", :mandatory=>"0", :position=>"0")
end

Then /^I should see "([^"]*)" on the admission page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" on that admission page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Given /^I have a form_component with mandatory field in form_component page$/ do
  @object=ObjectForm.create(:title=>"Admission", :body=>"Admission form for MCA", :perma_link=>"/admission", :home_page=>"0", :email=>"amit@heurion.com")
  @form_component = @object.form_components.create(:object_form_id=>@object.id, :component_name=>"email", :component_display_name=>"E-mail", :component_type=>"Textfield", :mandatory=>"1", :position=>"0")
end

Then /^I should see "([^"]*)" on that admissions page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Then /^I should see "([^"]*)" on the object_form_index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Given /^I have a object_form in object_form_index page$/ do
  @object=ObjectForm.create(:title=>"Admission", :body=>"Admission form for MCA", :home_page=>"/admission")
end

When /^I press "([^"]*)" for "([^"]*)" on the object_form_index page$/ do |arg1, arg2|
  
  if arg1 == "Edit" 
    visit edit_page_path(@object)
  elsif arg1 == "Show"
    visit page_path(@object)
  end
end

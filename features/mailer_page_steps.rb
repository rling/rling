Then /^I should see "([^"]*)" on the mailer index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Given /^I have a mailer in mailer index page$/ do
  @mailer = Mailer.create(:handle=>"Thank you", :subject=>"Thank you mail", :body=>"Thank you for joining us")
end

Then /^I should see "([^"]*)" for "([^"]*)" on that mailer page$/ do |arg1, arg2|
  page.find('ul',:text=>arg2+" "+arg1)
end


When /^I press "([^"]*)" for "([^"]*)" on the mailer page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_mailer_path(@mailer)
  elsif arg1 == "Show"
    visit mailer_path(@mailer)
  end
end

Then /^I should see "([^"]*)" on the edit mailer page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on the mailer index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" for "([^"]*)" on the mailer show page$/ do |arg1, arg2|
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end

When /^I press "([^"]*)" for "([^"]*)" on the mailer index page$/ do |arg1, arg2|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

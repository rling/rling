Then /^I should see "([^"]*)" on the mailer index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that mailer page$/ do |arg1, arg2|
  page.find('ul',:text=>arg2+" "+arg1)
end

When /^I press "([^"]*)" for "([^"]*)" on the mailer index page$/ do |arg1, arg2|
  @mailer=Mailer.find_by_handle(arg2)
  if arg1 == "Edit" 
    visit edit_mailer_path(@mailer)
  end
end

Then /^I should see "([^"]*)" on the edit mailer page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end


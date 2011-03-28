Then /^I should see "([^"]*)" on the user index page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should not see "([^"]*)" on the user index page$/ do |arg1|
  page.find("#middle").text.index(arg1) == nil
end

Then /^I should see "([^"]*)" on the edit user page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

When /^I press "([^"]*)" for "([^"]*)" on the user index page$/ do |arg1, arg2|
  @user=User.find(:all)
  if arg1 == "Edit" 
    visit edit_user_path(@user)
  end
end

When /^I click "([^"]*)"$/ do |arg1|
  @user=User.find(:all)
  visit user_details_user_path(@user)
end

#Then /^I select "([^"]*)"$/ do |field|
# field = find_radio(field)
#  field.set
#end

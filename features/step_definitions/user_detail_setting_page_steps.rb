Given /^I have a user detail setting on the index page$/ do
  @user_detail_setting = UserDetailSetting.create(:field_name=>"sex",:field_values=>"male,female",:default_value=>"male",:mandatory=>1,:field_type=>"Radiobutton")
end


Then /^I should see "([^"]*)" on the user detail settings page$/ do |arg1|
  page.find('#middle').text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on that user detail setting page$/ do |arg1, arg2|
  page.find('ul',:text=>arg2+" "+arg1)
end




Then /^I should see "([^"]*)" on the edit user_detail_setting page$/ do |arg1|
  page.find("#middle").text.index(arg1).should_not eq(0)
end

Then /^I should see "([^"]*)" for "([^"]*)" on the user detail setting show page$/ do |arg1, arg2|
 # puts  page.find("#middle").native.to_html
  page.find('b',:text=>arg2)
  page.find('#middle').text.index(arg1).should_not eq(0)
end

When /^I press "([^"]*)" for the "([^"]*)" on the page$/ do |arg1, arg2|
  if arg1 == "Edit" 
    visit edit_user_detail_setting_path(@user_detail_setting)
  elsif arg1 == "Show"
    visit user_detail_setting_path(@user_detail_setting)
  end
end

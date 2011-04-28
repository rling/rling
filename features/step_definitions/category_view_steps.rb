Given /^I have a categoryset and view for category_view$/ do
  @categoryset = Factory(:categoryset)
  @category = Factory(:category, :categoryset_id=>@categoryset.id)
  @object_model = Factory(:object_model)
  @view = Factory(:view, :view_for=>@object_model.id)
end

Then /^I should see "([^"]*)" on the show category_view page$/ do |arg1|
  page.find('div',:text=>arg1)
end

Given /^I have a category view in category_view index page$/ do
  @categoryset = Factory(:categoryset)
  @category = Factory(:category, :categoryset_id=>@categoryset.id)
  @object_model = Factory(:object_model, :categoryset_id=>@categoryset.id)
  @view = Factory(:view, :view_for=>@object_model.id)
  @category_view = Factory(:category_view, :associated_view=>@view.id)
end

When /^I press "([^"]*)" for "([^"]*)" on the show category_view page$/ do |arg1, arg2|
  if arg1 == "Show"
    visit page_path( @category_view)
  elsif arg1 == "Edit"
    visit edit_page_path( @category_view)
  end
end

Then /^I should see "([^"]*)" on the list page$/ do |arg1|
  page.find('div',:text=>arg1)
end

When /^I press "([^"]*)" for "([^"]*)" on the view_index_page$/ do |arg1, arg2|
  visit query_page_path(@view)
end

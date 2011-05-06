require 'factory_girl'

Factory.define(:mailer) do |f|
  f.handle "Thank you"
  f.subject "Thank you mail"
  f.body "Thank you for joining us"
end

Factory.define(:menu) do |f|
  f.name "Home"
  f.level "1"
  f.menuset_id "1"
  f.position "1"
end

Factory.define(:menuset) do |f|
  f.name "Header2"
  f.description "Header2 Menu for rlingCMS"
end

Factory.define(:object_form) do |f|
  f.title "Admission"
  f.body "Admission form for MCA"
  f.perma_link "admission"
  f.home_page "0"
  f.page_view_type "1"
  f.type "ObjectForm"
  f.email "amit@heurion.com"
  f.allow_create_on_permission "0"
  f.status "Published"
  f.layout "admin"
end

Factory.define(:form_component) do |f|
  f.component_name "email"
  f.component_display_name "E-mail"
  f.component_type "Textfield"
  f.position "0"
end

Factory.define(:form_submission) do |f|

end

Factory.define(:form_datum) do |f|
  f.data_value "amit@heurion.com"
end

Factory.define(:pagelet) do |f|
  f.handle "Home"
  f.display_text "This is home menu"
end

Factory.define(:page) do |f|
  f.title "Home"
  f.body "This is home page"
  f.perma_link "home"
  f.home_page "0"
  f.page_view_type "0"
  f.allow_create_on_permission "0"
  f.layout "admin"
end

Factory.define(:page_variable_setting) do |f|
  f.name "SEO Meta Keywords"
  f.default_value "keywords"
end

Factory.define(:role) do |f|
  f.role_type "Admin"
  f.is_deletable "1"
end

Factory.define(:user_detail_setting) do |f|
  f.field_name "Name"
  f.field_type "Textfield"
  f.default_value "amit"
  f.mandatory "1"
  f.position "0"
end

Factory.define(:object_model) do |f|
  f.name "Blog"
  f.perma_link_parent "blogs"
  f.description "Blog page"
  f.allow_comments "1"
  f.allow_drafts "1"
  f.layout "admin"
end

Factory.define(:comment_component) do |f|
  f.component_name "user"
  f.component_display_name "User"
  f.component_type "Textfield"
  f.mandatory "1"
end

Factory.define(:comment_submission) do |f|
  f.parent_id "0"
  f.creator_id "1"
  f.updater_id "1"
  f.level "1"
end

Factory.define(:comment_datum) do |f|

end

Factory.define(:component_submission) do |f|
  f.parent_id "0"
  f.creator_id "1"
  f.updater_id "1"
end

Factory.define(:model_component) do |f|

end

Factory.define(:model_submission) do |f|
  f.perma_link "information"
  f.home_page "0"
  f.page_view_type "1"
  f.creator_id "1"
  f.updater_id "1"
  f.status "Published"
  f.created_at "2011-04-19 09:26:55"
end

Factory.define(:model_data) do |f|
  
end

Factory.define(:setting) do |f|
  f.name "allow_user_register_user"
  f.desc_text "Should the System allow users to sign up to the website on their own. i.e. Should there be a sign up link for the user to execute"
  f.setting_type "boolean"
end

Factory.define(:user) do |f|
  f.login "amit"
  f.email "amit@heurion.com"
  f.role_id "3"
  f.login_count "17"
  f.failed_login_count "1"
  f.current_login_ip "127.0.0.1"
  f.last_login_ip "127.0.0.1"
end

Factory.define(:view) do |f|
  f.title "Developer"
  f.body "This is Developer view"
  f.perma_link "developer"
  f.home_page "0"
  f.page_view_type "1"
  f.type "View"
  f.view_type "table"
  f.creator_id "1"
  f.updater_id "1"
  f.status "Published"
  f.layout "admin"
end

Factory.define(:view_component) do |f|
  f.name "name"
  f.is_linked "1"
  f.position "0"
  f.display_name "Blogs"
end

Factory.define(:view_condition) do |f|
  f.name "name"
  f.value "amit"
  f.operator "="
end

Factory.define(:categoryset) do |f|
  f.name "Technology"
  f.description "For latest technology"
end

Factory.define(:category) do |f|
  f.name "Ruby"
  f.description "Object Oriented Programming Language"
  f.parent_id "0"
  f.level "1"
  f.position "0"
end

Factory.define(:categorization) do |f|

end

Factory.define(:category_view) do |f|
  f.title "List"
  f.body "This is category view"
  f.perma_link "list"
  f.home_page "0"
  f.page_view_type "1"
  f.type "CategoryView"
  f.view_type "TreeView"
  f.view_for "1"
  f.creator_id "1"
  f.updater_id "1"
  f.status "Published"
  f.layout "admin"
end

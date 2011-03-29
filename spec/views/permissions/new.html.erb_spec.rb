require 'spec_helper'

describe "permissions/new.html.erb" do
  before(:each) do
    assign(:permission, stub_model(Permission,
      :role_id => 1,
      :permission_object => "MyString",
      :permission_type => "MyString",
      :activity_code => "MyString",
      :activity_display_text => "MyString",
      :status => false
    ).as_new_record)
  end

  it "renders new permission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => permissions_path, :method => "post" do
      assert_select "input#permission_role_id", :name => "permission[role_id]"
      assert_select "input#permission_permission_object", :name => "permission[permission_object]"
      assert_select "input#permission_permission_type", :name => "permission[permission_type]"
      assert_select "input#permission_activity_code", :name => "permission[activity_code]"
      assert_select "input#permission_activity_display_text", :name => "permission[activity_display_text]"
      assert_select "input#permission_status", :name => "permission[status]"
    end
  end
end

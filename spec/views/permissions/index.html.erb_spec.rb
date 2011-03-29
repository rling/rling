require 'spec_helper'

describe "permissions/index.html.erb" do
  before(:each) do
    assign(:permissions, [
      stub_model(Permission,
        :role_id => 1,
        :permission_object => "Permission Object",
        :permission_type => "Permission Type",
        :activity_code => "Activity Code",
        :activity_display_text => "Activity Display Text",
        :status => false
      ),
      stub_model(Permission,
        :role_id => 1,
        :permission_object => "Permission Object",
        :permission_type => "Permission Type",
        :activity_code => "Activity Code",
        :activity_display_text => "Activity Display Text",
        :status => false
      )
    ])
  end

  it "renders a list of permissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Permission Object".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Permission Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Activity Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Activity Display Text".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

require 'spec_helper'

describe "permissions/show.html.erb" do
  before(:each) do
    @permission = assign(:permission, stub_model(Permission,
      :role_id => 1,
      :permission_object => "Permission Object",
      :permission_type => "Permission Type",
      :activity_code => "Activity Code",
      :activity_display_text => "Activity Display Text",
      :status => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Permission Object/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Permission Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Activity Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Activity Display Text/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end

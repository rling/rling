require 'spec_helper'

describe "roles/new.html.erb" do
  before(:each) do
    assign(:role, stub_model(Role).as_new_record)
  end

  it "renders new role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roles_path, :method => "post" do
    end
  end
end

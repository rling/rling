require 'spec_helper'

describe "user_details/new.html.erb" do
  before(:each) do
    assign(:user_detail, stub_model(UserDetail).as_new_record)
  end

  it "renders new user_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_details_path, :method => "post" do
    end
  end
end

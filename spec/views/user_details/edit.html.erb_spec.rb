require 'spec_helper'

describe "user_details/edit.html.erb" do
  before(:each) do
    @user_detail = assign(:user_detail, stub_model(UserDetail))
  end

  it "renders the edit user_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_details_path(@user_detail), :method => "post" do
    end
  end
end

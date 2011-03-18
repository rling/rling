require 'spec_helper'

describe "user_details/index.html.erb" do
  before(:each) do
    assign(:user_details, [
      stub_model(UserDetail),
      stub_model(UserDetail)
    ])
  end

  it "renders a list of user_details" do
    render
  end
end

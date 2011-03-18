require 'spec_helper'

describe "user_details/show.html.erb" do
  before(:each) do
    @user_detail = assign(:user_detail, stub_model(UserDetail))
  end

  it "renders attributes in <p>" do
    render
  end
end

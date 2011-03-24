require 'spec_helper'

describe "mailers/show.html.erb" do
  before(:each) do
    @mailer = assign(:mailer, stub_model(Mailer,
      :subject => "Subject",
      :body => "MyText",
      :is_deletable => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end

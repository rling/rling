require 'spec_helper'

describe "mailers/index.html.erb" do
  before(:each) do
    assign(:mailers, [
      stub_model(Mailer,
        :subject => "Subject",
        :body => "MyText",
        :is_deletable => false
      ),
      stub_model(Mailer,
        :subject => "Subject",
        :body => "MyText",
        :is_deletable => false
      )
    ])
  end

  it "renders a list of mailers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

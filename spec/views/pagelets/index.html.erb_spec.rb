require 'spec_helper'

describe "pagelets/index.html.erb" do
  before(:each) do
    assign(:pagelets, [
      stub_model(Pagelet,
        :handle => "Handle",
        :display_text => "MyText"
      ),
      stub_model(Pagelet,
        :handle => "Handle",
        :display_text => "MyText"
      )
    ])
  end

  it "renders a list of pagelets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Handle".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

require 'spec_helper'

describe "pagelets/show.html.erb" do
  before(:each) do
    @pagelet = assign(:pagelet, stub_model(Pagelet,
      :handle => "Handle",
      :display_text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Handle/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end

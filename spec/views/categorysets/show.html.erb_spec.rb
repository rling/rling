require 'spec_helper'

describe "categorysets/show.html.erb" do
  before(:each) do
    @categoryset = assign(:categoryset, stub_model(Categoryset,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end

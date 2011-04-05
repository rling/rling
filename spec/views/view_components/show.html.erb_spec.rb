require 'spec_helper'

describe "view_components/show.html.erb" do
  before(:each) do
    @view_component = assign(:view_component, stub_model(ViewComponent,
      :view_id => 1,
      :name => "Name",
      :is_linked => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end

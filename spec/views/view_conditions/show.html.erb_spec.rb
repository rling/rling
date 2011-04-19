require 'spec_helper'

describe "view_conditions/show.html.erb" do
  before(:each) do
    @view_condition = assign(:view_condition, stub_model(ViewCondition,
      :view_id => 1,
      :name => "Name",
      :value => "Value",
      :operator => "Operator",
      :relation_with => "Relation With"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Operator/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Relation With/)
  end
end

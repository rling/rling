require 'spec_helper'

describe "view_conditions/index.html.erb" do
  before(:each) do
    assign(:view_conditions, [
      stub_model(ViewCondition,
        :view_id => 1,
        :name => "Name",
        :value => "Value",
        :operator => "Operator",
        :relation_with => "Relation With"
      ),
      stub_model(ViewCondition,
        :view_id => 1,
        :name => "Name",
        :value => "Value",
        :operator => "Operator",
        :relation_with => "Relation With"
      )
    ])
  end

  it "renders a list of view_conditions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Operator".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Relation With".to_s, :count => 2
  end
end

require 'spec_helper'

describe "view_conditions/new.html.erb" do
  before(:each) do
    assign(:view_condition, stub_model(ViewCondition,
      :view_id => 1,
      :name => "MyString",
      :value => "MyString",
      :operator => "MyString",
      :relation_with => "MyString"
    ).as_new_record)
  end

  it "renders new view_condition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => view_conditions_path, :method => "post" do
      assert_select "input#view_condition_view_id", :name => "view_condition[view_id]"
      assert_select "input#view_condition_name", :name => "view_condition[name]"
      assert_select "input#view_condition_value", :name => "view_condition[value]"
      assert_select "input#view_condition_operator", :name => "view_condition[operator]"
      assert_select "input#view_condition_relation_with", :name => "view_condition[relation_with]"
    end
  end
end

require 'spec_helper'

describe "settings/new.html.erb" do
  before(:each) do
    assign(:setting, stub_model(Setting).as_new_record)
  end

  it "renders new setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path, :method => "post" do
    end
  end
end

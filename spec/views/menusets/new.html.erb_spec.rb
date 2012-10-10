require 'spec_helper'

describe "menusets/new.html.erb" do
  before(:each) do
    assign(:menuset, stub_model(Menuset).as_new_record)
  end

  it "renders new menuset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menusets_path, :method => "post" do
    end
  end
end

require 'spec_helper'

describe "menusets/edit.html.erb" do
  before(:each) do
    @menuset = assign(:menuset, stub_model(Menuset))
  end

  it "renders the edit menuset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menusets_path(@menuset), :method => "post" do
    end
  end
end

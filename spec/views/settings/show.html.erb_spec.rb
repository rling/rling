require 'spec_helper'

describe "settings/show.html.erb" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting))
  end

  it "renders attributes in <p>" do
    render
  end
end

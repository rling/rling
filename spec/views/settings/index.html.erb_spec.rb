require 'spec_helper'

describe "settings/index.html.erb" do
  before(:each) do
    assign(:settings, [
      stub_model(Setting),
      stub_model(Setting)
    ])
  end

  it "renders a list of settings" do
    render
  end
end

require 'spec_helper'

describe "menusets/index.html.erb" do
  before(:each) do
    assign(:menusets, [
      stub_model(Menuset),
      stub_model(Menuset)
    ])
  end

  it "renders a list of menusets" do
    render
  end
end

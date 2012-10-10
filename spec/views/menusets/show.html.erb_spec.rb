require 'spec_helper'

describe "menusets/show.html.erb" do
  before(:each) do
    @menuset = assign(:menuset, stub_model(Menuset))
  end

  it "renders attributes in <p>" do
    render
  end
end

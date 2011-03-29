require 'spec_helper'

describe "model_submissions/index.html.erb" do
  before(:each) do
    assign(:model_submissions, [
      stub_model(ModelSubmission),
      stub_model(ModelSubmission)
    ])
  end

  it "renders a list of model_submissions" do
    render
  end
end

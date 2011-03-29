require 'spec_helper'

describe "model_submissions/show.html.erb" do
  before(:each) do
    @model_submission = assign(:model_submission, stub_model(ModelSubmission))
  end

  it "renders attributes in <p>" do
    render
  end
end

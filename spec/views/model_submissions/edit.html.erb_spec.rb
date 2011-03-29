require 'spec_helper'

describe "model_submissions/edit.html.erb" do
  before(:each) do
    @model_submission = assign(:model_submission, stub_model(ModelSubmission))
  end

  it "renders the edit model_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => model_submissions_path(@model_submission), :method => "post" do
    end
  end
end

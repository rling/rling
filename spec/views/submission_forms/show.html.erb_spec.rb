require 'spec_helper'

describe "submission_forms/show.html.erb" do
  before(:each) do
    @submission_form = assign(:submission_form, stub_model(SubmissionForm,
      :object_form_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end

require 'spec_helper'

describe "form_submissions/show.html.erb" do
  before(:each) do
    @form_submission = assign(:form_submission, stub_model(FormSubmission,
      :object_form_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end

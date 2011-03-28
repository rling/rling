require 'spec_helper'

describe "form_submissions/edit.html.erb" do
  before(:each) do
    @form_submission = assign(:form_submission, stub_model(FormSubmission,
      :object_form_id => 1
    ))
  end

  it "renders the edit form_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => form_submissions_path(@form_submission), :method => "post" do
      assert_select "input#form_submission_object_form_id", :name => "form_submission[object_form_id]"
    end
  end
end

require 'spec_helper'

describe "form_submissions/new.html.erb" do
  before(:each) do
    assign(:form_submission, stub_model(FormSubmission,
      :object_form_id => 1
    ).as_new_record)
  end

  it "renders new form_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => form_submissions_path, :method => "post" do
      assert_select "input#form_submission_object_form_id", :name => "form_submission[object_form_id]"
    end
  end
end

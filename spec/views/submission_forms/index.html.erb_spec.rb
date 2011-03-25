require 'spec_helper'

describe "submission_forms/index.html.erb" do
  before(:each) do
    assign(:submission_forms, [
      stub_model(SubmissionForm,
        :object_form_id => 1
      ),
      stub_model(SubmissionForm,
        :object_form_id => 1
      )
    ])
  end

  it "renders a list of submission_forms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

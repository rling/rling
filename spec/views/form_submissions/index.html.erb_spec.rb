require 'spec_helper'

describe "form_submissions/index.html.erb" do
  before(:each) do
    assign(:form_submissions, [
      stub_model(FormSubmission,
        :object_form_id => 1
      ),
      stub_model(FormSubmission,
        :object_form_id => 1
      )
    ])
  end

  it "renders a list of form_submissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

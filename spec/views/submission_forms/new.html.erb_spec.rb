require 'spec_helper'

describe "submission_forms/new.html.erb" do
  before(:each) do
    assign(:submission_form, stub_model(SubmissionForm,
      :object_form_id => 1
    ).as_new_record)
  end

  it "renders new submission_form form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => submission_forms_path, :method => "post" do
      assert_select "input#submission_form_object_form_id", :name => "submission_form[object_form_id]"
    end
  end
end

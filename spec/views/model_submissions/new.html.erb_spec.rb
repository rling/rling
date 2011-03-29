require 'spec_helper'

describe "model_submissions/new.html.erb" do
  before(:each) do
    assign(:model_submission, stub_model(ModelSubmission).as_new_record)
  end

  it "renders new model_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => model_submissions_path, :method => "post" do
    end
  end
end

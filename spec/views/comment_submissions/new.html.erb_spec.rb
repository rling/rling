require 'spec_helper'

describe "comment_submissions/new.html.erb" do
  before(:each) do
    assign(:comment_submission, stub_model(CommentSubmission).as_new_record)
  end

  it "renders new comment_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_submissions_path, :method => "post" do
    end
  end
end

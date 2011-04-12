require 'spec_helper'

describe "comment_submissions/index.html.erb" do
  before(:each) do
    assign(:comment_submissions, [
      stub_model(CommentSubmission),
      stub_model(CommentSubmission)
    ])
  end

  it "renders a list of comment_submissions" do
    render
  end
end

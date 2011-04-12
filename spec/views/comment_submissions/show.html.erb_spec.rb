require 'spec_helper'

describe "comment_submissions/show.html.erb" do
  before(:each) do
    @comment_submission = assign(:comment_submission, stub_model(CommentSubmission))
  end

  it "renders attributes in <p>" do
    render
  end
end

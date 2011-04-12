require 'spec_helper'

describe "comment_submissions/edit.html.erb" do
  before(:each) do
    @comment_submission = assign(:comment_submission, stub_model(CommentSubmission))
  end

  it "renders the edit comment_submission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_submissions_path(@comment_submission), :method => "post" do
    end
  end
end

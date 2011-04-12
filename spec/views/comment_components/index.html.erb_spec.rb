require 'spec_helper'

describe "comment_components/index.html.erb" do
  before(:each) do
    assign(:comment_components, [
      stub_model(CommentComponent),
      stub_model(CommentComponent)
    ])
  end

  it "renders a list of comment_components" do
    render
  end
end

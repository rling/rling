require 'spec_helper'

describe "comment_components/show.html.erb" do
  before(:each) do
    @comment_component = assign(:comment_component, stub_model(CommentComponent))
  end

  it "renders attributes in <p>" do
    render
  end
end

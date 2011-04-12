require 'spec_helper'

describe "comment_components/edit.html.erb" do
  before(:each) do
    @comment_component = assign(:comment_component, stub_model(CommentComponent))
  end

  it "renders the edit comment_component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_components_path(@comment_component), :method => "post" do
    end
  end
end

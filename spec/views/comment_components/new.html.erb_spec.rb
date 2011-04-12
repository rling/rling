require 'spec_helper'

describe "comment_components/new.html.erb" do
  before(:each) do
    assign(:comment_component, stub_model(CommentComponent).as_new_record)
  end

  it "renders new comment_component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_components_path, :method => "post" do
    end
  end
end

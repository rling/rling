require 'spec_helper'

describe "mailers/new.html.erb" do
  before(:each) do
    assign(:mailer, stub_model(Mailer,
      :subject => "MyString",
      :body => "MyText",
      :is_deletable => false
    ).as_new_record)
  end

  it "renders new mailer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mailers_path, :method => "post" do
      assert_select "input#mailer_subject", :name => "mailer[subject]"
      assert_select "textarea#mailer_body", :name => "mailer[body]"
      assert_select "input#mailer_is_deletable", :name => "mailer[is_deletable]"
    end
  end
end

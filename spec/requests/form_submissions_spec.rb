require 'spec_helper'

describe "FormSubmissions" do
  describe "GET /form_submissions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get form_submissions_path
      response.status.should be(200)
    end
  end
end

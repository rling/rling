require 'spec_helper'

describe "Pagelets" do
  describe "GET /pagelets" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get pagelets_path
      response.status.should be(200)
    end
  end
end

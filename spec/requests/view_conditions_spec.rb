require 'spec_helper'

describe "ViewConditions" do
  describe "GET /view_conditions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get view_conditions_path
      response.status.should be(200)
    end
  end
end

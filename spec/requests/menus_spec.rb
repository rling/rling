require 'spec_helper'

describe "Menus" do
  describe "GET /menus" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get menus_path
      response.status.should be(200)
    end
  end
end

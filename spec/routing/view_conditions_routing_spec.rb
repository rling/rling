require "spec_helper"

describe ViewConditionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/view_conditions" }.should route_to(:controller => "view_conditions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/view_conditions/new" }.should route_to(:controller => "view_conditions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/view_conditions/1" }.should route_to(:controller => "view_conditions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/view_conditions/1/edit" }.should route_to(:controller => "view_conditions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/view_conditions" }.should route_to(:controller => "view_conditions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/view_conditions/1" }.should route_to(:controller => "view_conditions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/view_conditions/1" }.should route_to(:controller => "view_conditions", :action => "destroy", :id => "1")
    end

  end
end

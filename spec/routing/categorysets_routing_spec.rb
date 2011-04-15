require "spec_helper"

describe CategorysetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/categorysets" }.should route_to(:controller => "categorysets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/categorysets/new" }.should route_to(:controller => "categorysets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/categorysets/1" }.should route_to(:controller => "categorysets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/categorysets/1/edit" }.should route_to(:controller => "categorysets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/categorysets" }.should route_to(:controller => "categorysets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/categorysets/1" }.should route_to(:controller => "categorysets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/categorysets/1" }.should route_to(:controller => "categorysets", :action => "destroy", :id => "1")
    end

  end
end

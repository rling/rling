require "spec_helper"

describe ViewComponentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/view_components" }.should route_to(:controller => "view_components", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/view_components/new" }.should route_to(:controller => "view_components", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/view_components/1" }.should route_to(:controller => "view_components", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/view_components/1/edit" }.should route_to(:controller => "view_components", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/view_components" }.should route_to(:controller => "view_components", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/view_components/1" }.should route_to(:controller => "view_components", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/view_components/1" }.should route_to(:controller => "view_components", :action => "destroy", :id => "1")
    end

  end
end

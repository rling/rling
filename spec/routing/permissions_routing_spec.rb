require "spec_helper"

describe PermissionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/permissions" }.should route_to(:controller => "permissions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/permissions/new" }.should route_to(:controller => "permissions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/permissions/1" }.should route_to(:controller => "permissions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/permissions/1/edit" }.should route_to(:controller => "permissions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/permissions" }.should route_to(:controller => "permissions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/permissions/1" }.should route_to(:controller => "permissions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/permissions/1" }.should route_to(:controller => "permissions", :action => "destroy", :id => "1")
    end

  end
end

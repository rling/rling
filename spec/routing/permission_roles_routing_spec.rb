require "spec_helper"

describe PermissionRolesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/permission_roles" }.should route_to(:controller => "permission_roles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/permission_roles/new" }.should route_to(:controller => "permission_roles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/permission_roles/1" }.should route_to(:controller => "permission_roles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/permission_roles/1/edit" }.should route_to(:controller => "permission_roles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/permission_roles" }.should route_to(:controller => "permission_roles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/permission_roles/1" }.should route_to(:controller => "permission_roles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/permission_roles/1" }.should route_to(:controller => "permission_roles", :action => "destroy", :id => "1")
    end

  end
end

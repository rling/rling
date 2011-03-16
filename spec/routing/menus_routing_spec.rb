require "spec_helper"

describe MenusController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/menus" }.should route_to(:controller => "menus", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/menus/new" }.should route_to(:controller => "menus", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/menus/1" }.should route_to(:controller => "menus", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/menus/1/edit" }.should route_to(:controller => "menus", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/menus" }.should route_to(:controller => "menus", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/menus/1" }.should route_to(:controller => "menus", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/menus/1" }.should route_to(:controller => "menus", :action => "destroy", :id => "1")
    end

  end
end

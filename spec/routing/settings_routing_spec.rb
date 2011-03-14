require "spec_helper"

describe SettingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/settings" }.should route_to(:controller => "settings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/settings/new" }.should route_to(:controller => "settings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/settings/1" }.should route_to(:controller => "settings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/settings/1/edit" }.should route_to(:controller => "settings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/settings" }.should route_to(:controller => "settings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/settings/1" }.should route_to(:controller => "settings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/settings/1" }.should route_to(:controller => "settings", :action => "destroy", :id => "1")
    end

  end
end

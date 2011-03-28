require "spec_helper"

describe ObjectModelsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/object_models" }.should route_to(:controller => "object_models", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/object_models/new" }.should route_to(:controller => "object_models", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/object_models/1" }.should route_to(:controller => "object_models", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/object_models/1/edit" }.should route_to(:controller => "object_models", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/object_models" }.should route_to(:controller => "object_models", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/object_models/1" }.should route_to(:controller => "object_models", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/object_models/1" }.should route_to(:controller => "object_models", :action => "destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe ModelComponentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/model_components" }.should route_to(:controller => "model_components", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/model_components/new" }.should route_to(:controller => "model_components", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/model_components/1" }.should route_to(:controller => "model_components", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/model_components/1/edit" }.should route_to(:controller => "model_components", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/model_components" }.should route_to(:controller => "model_components", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/model_components/1" }.should route_to(:controller => "model_components", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/model_components/1" }.should route_to(:controller => "model_components", :action => "destroy", :id => "1")
    end

  end
end

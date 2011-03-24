require "spec_helper"

describe FormComponentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/form_components" }.should route_to(:controller => "form_components", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/form_components/new" }.should route_to(:controller => "form_components", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/form_components/1" }.should route_to(:controller => "form_components", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/form_components/1/edit" }.should route_to(:controller => "form_components", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/form_components" }.should route_to(:controller => "form_components", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/form_components/1" }.should route_to(:controller => "form_components", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/form_components/1" }.should route_to(:controller => "form_components", :action => "destroy", :id => "1")
    end

  end
end

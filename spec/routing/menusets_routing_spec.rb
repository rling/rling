require "spec_helper"

describe MenusetsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/menusets" }.should route_to(:controller => "menusets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/menusets/new" }.should route_to(:controller => "menusets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/menusets/1" }.should route_to(:controller => "menusets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/menusets/1/edit" }.should route_to(:controller => "menusets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/menusets" }.should route_to(:controller => "menusets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/menusets/1" }.should route_to(:controller => "menusets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/menusets/1" }.should route_to(:controller => "menusets", :action => "destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe ViewOrdersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/view_orders" }.should route_to(:controller => "view_orders", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/view_orders/new" }.should route_to(:controller => "view_orders", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/view_orders/1" }.should route_to(:controller => "view_orders", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/view_orders/1/edit" }.should route_to(:controller => "view_orders", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/view_orders" }.should route_to(:controller => "view_orders", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/view_orders/1" }.should route_to(:controller => "view_orders", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/view_orders/1" }.should route_to(:controller => "view_orders", :action => "destroy", :id => "1")
    end

  end
end

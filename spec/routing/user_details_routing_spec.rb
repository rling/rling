require "spec_helper"

describe UserDetailsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/user_details" }.should route_to(:controller => "user_details", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/user_details/new" }.should route_to(:controller => "user_details", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/user_details/1" }.should route_to(:controller => "user_details", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/user_details/1/edit" }.should route_to(:controller => "user_details", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/user_details" }.should route_to(:controller => "user_details", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/user_details/1" }.should route_to(:controller => "user_details", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/user_details/1" }.should route_to(:controller => "user_details", :action => "destroy", :id => "1")
    end

  end
end

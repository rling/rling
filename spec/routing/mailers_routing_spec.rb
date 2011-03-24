require "spec_helper"

describe MailersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/mailers" }.should route_to(:controller => "mailers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/mailers/new" }.should route_to(:controller => "mailers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mailers/1" }.should route_to(:controller => "mailers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mailers/1/edit" }.should route_to(:controller => "mailers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mailers" }.should route_to(:controller => "mailers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/mailers/1" }.should route_to(:controller => "mailers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mailers/1" }.should route_to(:controller => "mailers", :action => "destroy", :id => "1")
    end

  end
end

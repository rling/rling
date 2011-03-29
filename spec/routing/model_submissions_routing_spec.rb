require "spec_helper"

describe ModelSubmissionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/model_submissions" }.should route_to(:controller => "model_submissions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/model_submissions/new" }.should route_to(:controller => "model_submissions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/model_submissions/1" }.should route_to(:controller => "model_submissions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/model_submissions/1/edit" }.should route_to(:controller => "model_submissions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/model_submissions" }.should route_to(:controller => "model_submissions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/model_submissions/1" }.should route_to(:controller => "model_submissions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/model_submissions/1" }.should route_to(:controller => "model_submissions", :action => "destroy", :id => "1")
    end

  end
end

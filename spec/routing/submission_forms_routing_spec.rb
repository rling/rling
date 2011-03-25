require "spec_helper"

describe SubmissionFormsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/submission_forms" }.should route_to(:controller => "submission_forms", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/submission_forms/new" }.should route_to(:controller => "submission_forms", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/submission_forms/1" }.should route_to(:controller => "submission_forms", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/submission_forms/1/edit" }.should route_to(:controller => "submission_forms", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/submission_forms" }.should route_to(:controller => "submission_forms", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/submission_forms/1" }.should route_to(:controller => "submission_forms", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/submission_forms/1" }.should route_to(:controller => "submission_forms", :action => "destroy", :id => "1")
    end

  end
end

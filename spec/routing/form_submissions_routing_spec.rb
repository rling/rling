require "spec_helper"

describe FormSubmissionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/form_submissions" }.should route_to(:controller => "form_submissions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/form_submissions/new" }.should route_to(:controller => "form_submissions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/form_submissions/1" }.should route_to(:controller => "form_submissions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/form_submissions/1/edit" }.should route_to(:controller => "form_submissions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/form_submissions" }.should route_to(:controller => "form_submissions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/form_submissions/1" }.should route_to(:controller => "form_submissions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/form_submissions/1" }.should route_to(:controller => "form_submissions", :action => "destroy", :id => "1")
    end

  end
end

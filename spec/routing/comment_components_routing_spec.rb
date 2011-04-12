require "spec_helper"

describe CommentComponentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/comment_components" }.should route_to(:controller => "comment_components", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/comment_components/new" }.should route_to(:controller => "comment_components", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/comment_components/1" }.should route_to(:controller => "comment_components", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/comment_components/1/edit" }.should route_to(:controller => "comment_components", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/comment_components" }.should route_to(:controller => "comment_components", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/comment_components/1" }.should route_to(:controller => "comment_components", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/comment_components/1" }.should route_to(:controller => "comment_components", :action => "destroy", :id => "1")
    end

  end
end

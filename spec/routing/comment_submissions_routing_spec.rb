require "spec_helper"

describe CommentSubmissionsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/comment_submissions" }.should route_to(:controller => "comment_submissions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/comment_submissions/new" }.should route_to(:controller => "comment_submissions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/comment_submissions/1" }.should route_to(:controller => "comment_submissions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/comment_submissions/1/edit" }.should route_to(:controller => "comment_submissions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/comment_submissions" }.should route_to(:controller => "comment_submissions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/comment_submissions/1" }.should route_to(:controller => "comment_submissions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/comment_submissions/1" }.should route_to(:controller => "comment_submissions", :action => "destroy", :id => "1")
    end

  end
end

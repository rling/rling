require "spec_helper"

describe UserDetailSettingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/user_detail_settings" }.should route_to(:controller => "user_detail_settings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/user_detail_settings/new" }.should route_to(:controller => "user_detail_settings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/user_detail_settings/1" }.should route_to(:controller => "user_detail_settings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/user_detail_settings/1/edit" }.should route_to(:controller => "user_detail_settings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/user_detail_settings" }.should route_to(:controller => "user_detail_settings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/user_detail_settings/1" }.should route_to(:controller => "user_detail_settings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/user_detail_settings/1" }.should route_to(:controller => "user_detail_settings", :action => "destroy", :id => "1")
    end

  end
end

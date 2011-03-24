require "spec_helper"

describe PageVariableSettingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/page_variable_settings" }.should route_to(:controller => "page_variable_settings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/page_variable_settings/new" }.should route_to(:controller => "page_variable_settings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/page_variable_settings/1" }.should route_to(:controller => "page_variable_settings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/page_variable_settings/1/edit" }.should route_to(:controller => "page_variable_settings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/page_variable_settings" }.should route_to(:controller => "page_variable_settings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/page_variable_settings/1" }.should route_to(:controller => "page_variable_settings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/page_variable_settings/1" }.should route_to(:controller => "page_variable_settings", :action => "destroy", :id => "1")
    end

  end
end

class Admin::ViewComponentsController < ApplicationController
  # FILTERS
  before_filter :require_admin
  before_filter :get_view

  # GET /views/1/view_components
  # GET /views/1/view_components.xml
  def index
    @view_components = @page.view_components.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @view_components }
    end
  end

  # GET /views/1/view_components/1
  # GET /views/1/view_components/1.xml
  def show
    @view_component = @page.view_components.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @view_component }
    end
  end

  # GET /views/1/view_components/new
  # GET /views/1/view_components/new.xml
  def new
    @view_component = @page.view_components.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @view_component }
    end
  end

  # GET /views/1/view_components/1/edit
  def edit
    @view_component = @page.view_components.find(params[:id])
  end

  # POST /views/1/view_components
  # POST /views/1/view_components.xml
  def create
    @view_component = @page.view_components.new(params[:view_component])

    respond_to do |format|
      if @view_component.save
        format.html { redirect_to(view_view_components_path, :notice => t(:view_component_created)) }
        format.xml  { render :xml => @view_component, :status => :created, :location => @view_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @view_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /views/1/view_components/1
  # PUT /views/1/view_components/1.xml
  def update
    @view_component = @page.view_components.find(params[:id])

    respond_to do |format|
      if @view_component.update_attributes(params[:view_component])
        format.html { redirect_to(view_view_components_path, :notice => t(:view_component_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @view_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /views/1/view_components/1
  # DELETE /views/1/view_components/1.xml
  def destroy
    @view_component = @page.view_components.find(params[:id])
    @view_component.destroy

    respond_to do |format|
      format.html { redirect_to(view_view_components_path(@page)) }
      format.xml  { head :ok }
    end
  end
  
  # POST /views/1/view_components/update_position
  # POST /views/1/view_components/update_position.xml
 def update_position
  ViewComponent.where(:view_id=>@page.id).each do  |view_component|
     view_component.update_attribute(:position,params["#{view_component.id}"])
    end
    respond_to do |format|
      format.html { redirect_to(view_view_components_path(@page)) }
      format.xml  { head :ok }
    end
  end
 
private
  #Get the Parent View (Page) Object to identify the nested URL
  def get_view
  @page=Page.find(params[:view_id])
  end
 
end

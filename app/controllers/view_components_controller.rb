class ViewComponentsController < ApplicationController
  # GET /view_components
  # GET /view_components.xml
  before_filter :get_view


  def index
    @view_components = @page.view_components.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @view_components }
    end
  end

  # GET /view_components/1
  # GET /view_components/1.xml
  def show
    @view_component = @page.view_components.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @view_component }
    end
  end

  # GET /view_components/new
  # GET /view_components/new.xml
  def new
    @view_component = @page.view_components.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @view_component }
    end
  end

  # GET /view_components/1/edit
  def edit
    @view_component = @page.view_components.find(params[:id])
  end

  # POST /view_components
  # POST /view_components.xml
  def create
    @view_component = @page.view_components.new(params[:view_component])

    respond_to do |format|
      if @view_component.save
        format.html { redirect_to(view_view_components_path, :notice => 'View component was successfully created.') }
        format.xml  { render :xml => @view_component, :status => :created, :location => @view_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @view_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /view_components/1
  # PUT /view_components/1.xml
  def update
    @view_component = @page.view_components.find(params[:id])

    respond_to do |format|
      if @view_component.update_attributes(params[:view_component])
        format.html { redirect_to(view_view_components_path, :notice => 'View component was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @view_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /view_components/1
  # DELETE /view_components/1.xml
  def destroy
    @view_component = @page.view_components.find(params[:id])
    @view_component.destroy

    respond_to do |format|
      format.html { redirect_to(view_view_components_path(@page)) }
      format.xml  { head :ok }
    end
  end
 def update_position

  ViewComponent.find_all_by_view_id(@page.id).each do  |view_component|
     view_component.update_attribute(:position,params["#{view_component.id}"])
    end
    redirect_to :action => 'index'
  end

  
  def get_view

  @page=View.find(params[:view_id])
  end
 
end

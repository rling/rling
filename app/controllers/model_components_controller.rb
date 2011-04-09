class ModelComponentsController < ApplicationController
  before_filter :require_admin
  before_filter :get_object_model
  
  # GET /model_components
  # GET /model_components.xml
  def index
    @model_components = @object.model_components.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @model_components }
    end
  end

  # GET /model_components/1
  # GET /model_components/1.xml
  def show
    @model_component =@object.model_components.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @model_component }
    end
  end

  # GET /model_components/new
  # GET /model_components/new.xml
  def new
    @model_component = @object.model_components.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @model_component }
    end
  end

  # GET /model_components/1/edit
  def edit
    @model_component = @object.model_components.find(params[:id])
  end

  # POST /model_components
  # POST /model_components.xml
  def create
    @model_component = @object.model_components.new(params[:model_component])

    respond_to do |format|
      if @model_component.save
        format.html { redirect_to([@object,@model_component], :notice => 'Model component was successfully created.') }
        format.xml  { render :xml => @model_component, :status => :created, :location => @model_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @model_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /model_components/1
  # PUT /model_components/1.xml
  def update
    @model_component = @object.model_components.find(params[:id])

    respond_to do |format|
      if @model_component.update_attributes(params[:model_component])
        format.html { redirect_to([@object,@model_component], :notice => 'Model component was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @model_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /model_components/1
  # DELETE /model_components/1.xml
  def destroy
    @model_component = @object.model_components.find(params[:id])
    @model_component.destroy

    respond_to do |format|
      format.html { redirect_to(object_model_model_components_path) }
      format.xml  { head :ok }
    end
  end


  def update_position
     ModelComponent.find_all_by_object_model_id(@object.id).each do  |model_component|
     model_component.update_attribute(:position,params["#{model_component.id}"])
  end
    redirect_to :action => 'index'
  end

   def get_object_model
     @object=ObjectModel.find(params[:object_model_id])
   end

end

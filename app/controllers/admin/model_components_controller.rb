class Admin::ModelComponentsController < ApplicationController
  #FILTERS
  before_filter :require_admin
  before_filter :get_object_model

  # GET /object_model/1/model_components
  # GET /object_model/1/model_components.xml
  def index
    @model_components = @object.model_components.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @model_components }
    end
  end

  # GET /object_model/1/model_components/1
  # GET /object_model/1/model_components/1.xml
  def show
    @model_component =@object.model_components.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @model_component }
    end
  end

  # GET /object_model/1/model_components/new
  # GET /model_components/new.xml
  def new
    @model_component = @object.model_components.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @model_component }
    end
  end

  # GET /object_model/1/model_components/1/edit
  def edit
    @model_component = @object.model_components.find(params[:id])
  end

  # POST /object_model/1/model_components
  # POST /object_model/1/model_components.xml
  def create
    @model_component = @object.model_components.new(params[:model_component])

    respond_to do |format|
      if @model_component.save
        format.html { redirect_to(object_model_model_components_path, :notice => t(:model_component_created)) }
        format.xml  { render :xml => @model_component, :status => :created, :location => @model_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @model_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /object_model/1/model_components/1
  # PUT /object_model/1/model_components/1.xml
  def update
    @model_component = @object.model_components.find(params[:id])

    respond_to do |format|
      if @model_component.update_attributes(params[:model_component])
        format.html { redirect_to(object_model_model_components_path, :notice => t(:model_component_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @model_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /object_model/1/model_components/1
  # DELETE /object_model/1/model_components/1.xml
  def destroy
    @model_component = @object.model_components.find(params[:id])
    @model_component.destroy

    respond_to do |format|
      format.html { redirect_to(object_model_model_components_path) }
      format.xml  { head :ok }
    end
  end


  # POST /object_model/1/model_components/update_position
  # POST /object_model/1/model_components/update_position.xml
  def update_position
     ModelComponent.where(:object_model_id=>@object.id).each do  |model_component|
     model_component.update_attribute(:position,params["#{model_component.id}"])
  end
   respond_to do |format|
      format.html { redirect_to(object_model_model_components_path) }
      format.xml  { head :ok }
    end
  end

private
  #GET The parent object model to which the model components are associated to.
   def get_object_model
     @object=ObjectModel.find(params[:object_model_id])
   end

end

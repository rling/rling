class Admin::FormComponentsController < ApplicationController

#SWEEPER
  cache_sweeper :page_sweeper,  :only => [:create, :update, :destroy]
#Filters
 before_filter :require_admin
 before_filter :get_object_form
 before_filter :find_form_component, :only => [:show, :edit, :update, :destroy]

  # GET /object_form/1/form_components
  # GET /object_form/1/form_components.xml
  def index
    @form_components = @page.form_components.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @form_components }
    end
  end

  # GET /object_form/1/form_components/1
  # GET /object_form/1/form_components/1.xml
  def show
   # @form_component = @page.form_components.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @form_component }
    end
  end

  # GET /object_form/1/form_components/new
  # GET /object_form/1/form_components/new.xml
  def new
    @page = ObjectForm.find(params[:object_form_id])
    @form_component = @page.form_components.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @form_component }
    end
  end

  # GET /object_form/1/form_components/1/edit
  def edit
   # @form_component = @page.form_components.find(params[:id])
  end

  # POST /object_form/1/form_components
  # POST /object_form/1/form_components.xml
  def create
    @form_component = @page.form_components.new(params[:form_component])

    respond_to do |format|
      if @form_component.save
        format.html { redirect_to(object_form_form_components_path, :notice => t(:form_component_created)) }
        format.xml  { render :xml => @form_component, :status => :created, :location => @form_component }
      else
        format.html { render  "new" }
        format.xml  { render :xml => @form_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /object_form/1/form_components/1
  # PUT /object_form/1/form_components/1.xml
  def update
    #@form_component = @page.form_components.find(params[:id])

    respond_to do |format|
      if @form_component.update_attributes(params[:form_component])
        format.html { redirect_to(object_form_form_components_path, :notice => t(:form_component_updated)) }
        format.xml  { head :ok }
      else
        format.html { render  "edit" }
        format.xml  { render :xml => @form_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /object_form/1/form_components/1
  # DELETE /object_form/1/form_components/1.xml
  def destroy
   # @form_component = @page.form_components.find(params[:id])
    @form_component.destroy
    respond_to do |format|
      format.html { redirect_to(object_form_form_components_path(@page)) }
      format.xml  { head :ok }
    end
  end

  # POST /object_form/1/form_components/update_position
  # POST /object_form/1/form_components/update_position.xml
  def update_position
      FormComponent.find_all_by_object_form_id(@page.id).each do  |form_component|
     form_component.update_attribute(:position,params["#{form_component.id}"])
  end
    respond_to do |format|
      format.html { redirect_to(object_form_form_components_path(@page)) }
      format.xml  { head :ok }
    end
  end
 private
  # Get the Object Form (Page Object) to which the form components are associated to.
  def get_object_form
  @page=ObjectForm.find(params[:object_form_id])
  end

  def find_form_component
     @form_component = @page.form_components.find(params[:id])
  end
end

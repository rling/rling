class ObjectModelsController < ApplicationController

  #FILTERS
  before_filter :require_admin
  
  # GET /object_models
  # GET /object_models.xml
  def index
    @object_models = ObjectModel.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @object_models }
    end
  end

  # GET /object_models/1
  # GET /object_models/1.xml
  def show
    @object_model = ObjectModel.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @object_model }
    end
  end

  # GET /object_models/new
  # GET /object_models/new.xml
  def new
    @object_model = ObjectModel.new
   respond_to do |format|
    format.html # new.html.erb
    format.xml  { render :xml => @object_model }
    end
  end

  # GET /object_models/1/edit
  def edit
    @object_model = ObjectModel.find(params[:id])
  end

  # POST /object_models
  # POST /object_models.xml
  def create
    @object_model = ObjectModel.new(params[:object_model])
    if params[:permalnkparent] == "1"
           @object_model.perma_link_generate
    end
    respond_to do |format|
      if @object_model.save
        format.html { redirect_to(object_models_path, :notice => 'Object model was successfully created.') }
        format.xml  { render :xml => @object_model, :status => :created, :location => @object_model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @object_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /object_models/1
  # PUT /object_models/1.xml
  def update
    @object_model = ObjectModel.find(params[:id])
    if params[:permalnkparent] == "1"
   	@object_model.perma_link_generate
    end
    
    respond_to do |format|
      if @object_model.update_attributes(params[:object_model])
       @object_model.update_attributes(:email_on_comment => false ,:is_comment_recursive=>false) unless @object_model.allow_comments

        format.html { redirect_to(object_models_path, :notice => 'Object model was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @object_model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /object_models/1
  # DELETE /object_models/1.xml
  def destroy
    @object_model = ObjectModel.find(params[:id])
    @object_model.destroy
    respond_to do |format|
      format.html { redirect_to(object_models_url) }
      format.xml  { head :ok }
    end
  end
end

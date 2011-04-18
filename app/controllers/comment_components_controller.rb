class CommentComponentsController < ApplicationController
  #FILTERS
  before_filter :require_admin
  before_filter :get_object_model

  # GET /object_models/1/comment_components
  # GET /object_models/1/comment_components.xml
  def index
    @comment_components = @object.comment_components.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comment_components }
    end
  end

  # GET /object_models/1/comment_components/1
  # GET /object_models/1/comment_components/1.xml
  def show
    @comment_component = @object.comment_components.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment_component }
    end
  end

  # GET /object_models/1/comment_components/new
  # GET /object_models/1/comment_components/new.xml
  def new
    @comment_component = @object.comment_components.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment_component }
    end
  end

  # GET /object_models/1/comment_components/1/edit
  def edit
    @comment_component = @object.comment_components.find(params[:id])
  end

  # POST /object_models/1/comment_components
  # POST /object_models/1/comment_components.xml
  def create
    @comment_component = @object.comment_components.new(params[:comment_component])
    respond_to do |format|
      if @comment_component.save
        format.html { redirect_to([@object,@comment_component], :notice => 'Comment component was successfully created.') }
        format.xml  { render :xml => @comment_component, :status => :created, :location => @comment_component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /object_models/1/comment_components/1
  # PUT /object_models/1/comment_components/1.xml
  def update
    @comment_component =@object.comment_components.find(params[:id])
    respond_to do |format|
      if @comment_component.update_attributes(params[:comment_component])
        format.html { redirect_to([@object,@comment_component], :notice => 'Comment component was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment_component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /object_models/1/comment_components/1
  # DELETE /object_models/1/comment_components/1.xml
  def destroy
    @comment_component = @object.comment_components.find(params[:id])
    @comment_component.destroy
    respond_to do |format|
      format.html { redirect_to(object_model_comment_components_url) }
      format.xml  { head :ok }
    end
  end

  private
  #Get the Parent Object Model to which components are associated to.
   def get_object_model
     @object=ObjectModel.find(params[:object_model_id])
   end
end

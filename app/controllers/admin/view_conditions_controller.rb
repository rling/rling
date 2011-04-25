class Admin::ViewConditionsController < ApplicationController

  before_filter :require_admin
 before_filter :get_view
  # GET /view_conditions
  # GET /view_conditions.xml
  def index
    @view_conditions = @page.view_conditions.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @view_conditions }
    end
  end

  # GET /view_conditions/1
  # GET /view_conditions/1.xml
  def show
    @view_condition =  @page.view_conditions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @view_condition }
    end
  end

  # GET /view_conditions/new
  # GET /view_conditions/new.xml
  def new
    @view_condition =  @page.view_conditions.new
     respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @view_condition }
    end
  end

  # GET /view_conditions/1/edit
  def edit
    @view_condition =  @page.view_conditions.find(params[:id])
  end

  # POST /view_conditions
  # POST /view_conditions.xml
  def create
    @view_condition = @page.view_conditions.new(params[:view_condition])

    respond_to do |format|
      if @view_condition.save
        format.html { redirect_to(view_view_conditions_path, :notice => t(:view_condition_created)) }
        format.xml  { render :xml => @view_condition, :status => :created, :location => @view_condition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @view_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /view_conditions/1
  # PUT /view_conditions/1.xml
  def update
    @view_condition =  @page.view_conditions.find(params[:id])

    respond_to do |format|
      if @view_condition.update_attributes(params[:view_condition])
        format.html { redirect_to(view_view_conditions_path, :notice => t(:view_condition_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @view_condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /view_conditions/1
  # DELETE /view_conditions/1.xml
  def destroy
    @view_condition =  @page.view_conditions.find(params[:id])
    @view_condition.destroy

    respond_to do |format|
      format.html { redirect_to(view_view_conditions_url) }
      format.xml  { head :ok }
    end
  end

  private
  # Get the View (Page Object) to which the conditions are associated to.
  def get_view
  @page=View.find(params[:view_id])
  end
end

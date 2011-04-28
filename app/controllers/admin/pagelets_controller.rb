class Admin::PageletsController < ApplicationController
#SWEEPER
cache_sweeper :pagelet_sweeper,  :only => [:create, :update, :destroy]
#FILTERS
before_filter :require_admin


  # GET /pagelets
  # GET /pagelets.xml
  def index
    @pagelets = Pagelet.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pagelets }
    end
  end

  # GET /pagelets/1
  # GET /pagelets/1.xml
  def show
    @pagelet = Pagelet.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pagelet }
    end
  end

  # GET /pagelets/new
  # GET /pagelets/new.xml
  def new
    @pagelet = Pagelet.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pagelet }
    end
  end

  # GET /pagelets/1/edit
  def edit
    @pagelet = Pagelet.find(params[:id])
  end

  # POST /pagelets
  # POST /pagelets.xml
  def create
    @pagelet = Pagelet.new(params[:pagelet])
    respond_to do |format|
      if @pagelet.save
        format.html { redirect_to(pagelets_path, :notice => t(:pagelet_created)) }
        format.xml  { render :xml => @pagelet, :status => :created, :location => @pagelet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pagelet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pagelets/1
  # PUT /pagelets/1.xml
  def update
    @pagelet = Pagelet.find(params[:id])
    respond_to do |format|
      if @pagelet.update_attributes(params[:pagelet])
        format.html { redirect_to(pagelets_path, :notice => t(:pagelet_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pagelet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pagelets/1
  # DELETE /pagelets/1.xml
  def destroy
    @pagelet = Pagelet.find(params[:id])
    @pagelet.destroy
    respond_to do |format|
      format.html { redirect_to(pagelets_url,:notice => t(:pagelet_deleted)) }
      format.xml  { head :ok }
    end
  end
end

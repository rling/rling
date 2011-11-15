class Admin::MenusetsController < ApplicationController
#FILTERS
  before_filter :find_menuset, :only => [:show, :edit, :update, :destroy]
  before_filter :require_admin

  # GET /menusets
  # GET /menusets.xml
  def index
    @menusets = Menuset.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menusets }
    end
  end

  # GET /menusets/1
  # GET /menusets/1.xml
  def show
    #@menuset = Menuset.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menuset }
    end
  end

  # GET /menusets/new
  # GET /menusets/new.xml
  def new
    @menuset = Menuset.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menuset }
    end
  end

  # GET /menusets/1/edit
  def edit
    #@menuset = Menuset.find(params[:id])
  end

  # POST /menusets
  # POST /menusets.xml
  def create
    @menuset = Menuset.new(params[:menuset])
    respond_to do |format|
      if @menuset.save
        format.html { redirect_to(menusets_path, :notice => t(:menuset_created)) }
        format.xml  { render :xml => @menuset, :status => :created, :location => @menuset }
      else
        format.html { render  "new" }
        format.xml  { render :xml => @menuset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menusets/1
  # PUT /menusets/1.xml
  def update
    #@menuset = Menuset.find(params[:id])
    respond_to do |format|
      if @menuset.update_attributes(params[:menuset])
        format.html { redirect_to(menusets_path, :notice => t(:menu_updated)) }
        format.xml  { head :ok }
      else
        format.html { render  "edit" }
        format.xml  { render :xml => @menuset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menusets/1
  # DELETE /menusets/1.xml
  def destroy
   # @menuset = Menuset.find(params[:id])
    @menuset.destroy
    respond_to do |format|
      format.html { redirect_to(menusets_url,:notice=>t(:menu_deleted)) }
      format.xml  { head :ok }
    end
  end
  private
  def find_menuset
     @menuset = Menuset.find(params[:id])
  end
end

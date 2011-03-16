class MenusetsController < ApplicationController
  # GET /menusets
  # GET /menusets.xml

  before_filter :require_user, :require_admin

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
    @menuset = Menuset.find(params[:id])

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
    @menuset = Menuset.find(params[:id])
  end

  # POST /menusets
  # POST /menusets.xml
  def create
    @menuset = Menuset.new(params[:menuset])

    respond_to do |format|
      if @menuset.save
        format.html { redirect_to(@menuset, :notice => 'Menuset was successfully created.') }
        format.xml  { render :xml => @menuset, :status => :created, :location => @menuset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menuset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menusets/1
  # PUT /menusets/1.xml
  def update
    @menuset = Menuset.find(params[:id])

    respond_to do |format|
      if @menuset.update_attributes(params[:menuset])
        format.html { redirect_to(@menuset, :notice => 'Menuset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menuset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menusets/1
  # DELETE /menusets/1.xml
  def destroy
    @menuset = Menuset.find(params[:id])
    @menuset.destroy

    respond_to do |format|
      format.html { redirect_to(menusets_url) }
      format.xml  { head :ok }
    end
  end
end

class PageVariableSettingsController < ApplicationController
  before_filter :require_admin

  # GET /page_variable_settings
  # GET /page_variable_settings.xml
  def index
    @page_variable_settings = PageVariableSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @page_variable_settings }
    end
  end

  # GET /page_variable_settings/1
  # GET /page_variable_settings/1.xml
  def show
    @page_variable_setting = PageVariableSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page_variable_setting }
    end
  end

  # GET /page_variable_settings/new
  # GET /page_variable_settings/new.xml
  def new
    @page_variable_setting = PageVariableSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page_variable_setting }
    end
  end

  # GET /page_variable_settings/1/edit
  def edit
    @page_variable_setting = PageVariableSetting.find(params[:id])
  end

  # POST /page_variable_settings
  # POST /page_variable_settings.xml
  def create
    @page_variable_setting = PageVariableSetting.new(params[:page_variable_setting])

    respond_to do |format|
      if @page_variable_setting.save
        format.html { redirect_to(@page_variable_setting, :notice => 'Page variable setting was successfully created.') }
        format.xml  { render :xml => @page_variable_setting, :status => :created, :location => @page_variable_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_variable_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /page_variable_settings/1
  # PUT /page_variable_settings/1.xml
  def update
    @page_variable_setting = PageVariableSetting.find(params[:id])

    respond_to do |format|
      if @page_variable_setting.update_attributes(params[:page_variable_setting])
        format.html { redirect_to(@page_variable_setting, :notice => 'Page variable setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page_variable_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /page_variable_settings/1
  # DELETE /page_variable_settings/1.xml
  def destroy
    @page_variable_setting = PageVariableSetting.find(params[:id])
    @page_variable_setting.destroy

    respond_to do |format|
      format.html { redirect_to(page_variable_settings_url) }
      format.xml  { head :ok }
    end
  end
end

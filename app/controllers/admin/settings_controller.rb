class Admin::SettingsController < ApplicationController
#FILTER
  before_filter :find_setting, :only => [:show, :edit, :update, :destroy]
  before_filter  :require_admin

  # GET /settings
  # GET /settings.xml
  def index
     @settings = Setting.where(:setting_type=>'string')
    @setting_booleans=Setting.where(:setting_type=>'boolean')
    @setting_colors=Setting.where(:setting_type=>'colorbox')
    @setting_sizes=Setting.where(:setting_type=>'integer')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @settings }
    end
  end

  # GET /settings/1
  # GET /settings/1.xml
  def show
    #@setting = Setting.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @setting }
    end
  end

  # GET /settings/new
  # GET /settings/new.xml
  def new
    @setting = Setting.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @setting }
    end
  end

  # GET /settings/1/edit
  def edit
    #@setting = Setting.find(params[:id])
  end

  # POST /settings
  # POST /settings.xml
  def create
    @setting = Setting.new(params[:setting])
    respond_to do |format|
      if @setting.save
                session[:settings][@setting.name.intern] = @setting.setting_value unless session[:settings].nil?
        format.html { redirect_to(@setting, :notice => t(:setting_created)) }
        format.xml  { render :xml => @setting, :status => :created, :location => @setting }
      else
        format.html { render  "new" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /settings/1
  # PUT /settings/1.xml
  def update
   # @setting = Setting.find(params[:id])
    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        session[:settings][@setting.name.intern] = @setting.setting_value unless session[:settings].nil?
        format.html { redirect_to(settings_path, :notice => t(:setting_updated)) }
        format.xml  { head :ok }
      else
        format.html { render  "edit" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.xml
  def destroy
    #@setting = Setting.find(params[:id])
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to(settings_url) }
      format.xml  { head :ok }
    end
  end

# GET /settings/reload_style
def reload_style
  @load_style_settings
  flash[:notice] = t(:styles_reloaded)
  respond_to do |format|
      format.html { redirect_to(settings_path) }
      format.xml  { head :ok }
    end
  end
private
  def find_setting
     @setting = Setting.find(params[:id])
  end
end

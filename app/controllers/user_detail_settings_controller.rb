class UserDetailSettingsController < ApplicationController
  before_filter :require_admin
  
  # GET /user_detail_settings
  # GET /user_detail_settings.xml
  def index
    @user_detail_settings = UserDetailSetting.all(:order =>'position')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_detail_settings }
    end
  end

  # GET /user_detail_settings/1
  # GET /user_detail_settings/1.xml
  def show
    @user_detail_setting = UserDetailSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_detail_setting }
    end
  end

  # GET /user_detail_settings/new
  # GET /user_detail_settings/new.xml
  def new
    @user_detail_setting = UserDetailSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_detail_setting }
    end
  end

  # GET /user_detail_settings/1/edit
  def edit
    @user_detail_setting = UserDetailSetting.find(params[:id])
  end

  # POST /user_detail_settings
  # POST /user_detail_settings.xml
  def create
    @user_detail_setting = UserDetailSetting.new(params[:user_detail_setting])

    respond_to do |format|
      if @user_detail_setting.save
        format.html { redirect_to(@user_detail_setting, :notice => 'User detail setting was successfully created.') }
        format.xml  { render :xml => @user_detail_setting, :status => :created, :location => @user_detail_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_detail_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_detail_settings/1
  # PUT /user_detail_settings/1.xml
  def update
    @user_detail_setting = UserDetailSetting.find(params[:id])

    respond_to do |format|
      if @user_detail_setting.update_attributes(params[:user_detail_setting])
        format.html { redirect_to(@user_detail_setting, :notice => 'User detail setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_detail_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_detail_settings/1
  # DELETE /user_detail_settings/1.xml
  def destroy
    @user_detail_setting = UserDetailSetting.find(params[:id])
    @user_detail_setting.destroy

    respond_to do |format|
      format.html { redirect_to(user_detail_settings_url) }
      format.xml  { head :ok }
    end
  end


  def update_position
     UserDetailSetting.all.each do  |user_detail_setting|
    user_detail_setting.update_attribute(:position,params["#{user_detail_setting.id}"])
  end
    redirect_to :action => 'index'
  end
end

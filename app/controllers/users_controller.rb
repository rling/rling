class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  before_filter :require_user, :except => [:new,:create,:activate]
  before_filter :require_admin, :except => [:new,:create,:activate]
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    userid = params[:id]
    userid = current_user.id if userid.nil? 
    @user = User.find(userid)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
   if current_user?
    setting = Setting.find_by_name("allow_admin_register_user")
    puts setting.setting_data
    if current_user.admin? && !setting.setting_data
     flash[:notice] = "Admin cannot create a new User"
     respond_to do |format|
      format.html {redirect_to users_path }
     end   
    else
      @user = User.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user }
      end
    end
  else
    setting = Setting.find_by_name("allow_user_register_user")
    unless setting.setting_data
     flash[:notice] = "User is not authorized to register into the site"
     respond_to do |format|
      format.html {redirect_to "/"}
     end
    else
     @user = User.new
     respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
     end
    end
   end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.role_id = params[:admin] 
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'Login successful.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        @user.admin = params[:admin]
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    if @user.admin? 
     if User.admins.size > 1
       @user.destroy
       flash[:notice] = "User deleted successfully"
     else
              flash[:notice] = "Atleast one administrator required to execute website activities"
     end
    else
       @user.destroy
       flash[:notice] = "User deleted successfully"
    end
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

 def activate
   @user_setting = UserSetting.find(:first)
   @user=User.find(params[:id])
   @user.activation_key = nil
   @user.save(false)
     if @user.role_id == 1
        respond_to do |format|
          format.html {redirect_to home_index_path }
          format.xml { render :xml =>@user }
        end
     elsif @user.role_id == 2 
        if @user_setting.login_email == true
           respond_to do |format|
             format.html {redirect_to log_settings_path }
             format.xml { render :xml =>@user }
         end
         else
            respond_to do |format|
              format.html {redirect_to gen_login_settings_path }
              format.xml { render :xml =>@user }
         end
      end
      end
 end

end

def save_password
  @user = User.find(params[:id])
  if request.post?
      @user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      if @user.save
         flash[:message] = "your password is changed"
        respond_to do |format|
            format.html {redirect_to login_users_path}
            format.xml {render :xml =>@user}
        end
      else
         respond_to do |format|
            format.html {render :action=> "change_password"}
            format.xml {render :xml =>@user}
        end

      end
   end

end

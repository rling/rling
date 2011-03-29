class SessionsController < ApplicationController
def first_user
@user = User.find(:first)
  if @user
   if @user.nil?
      redirect_to first_user_sessions_path
   else
      redirect_to login_path
  end
 end
end

def first_user_create
#Create the First User
   role=Role.find_by_role_type("Administrator")
   user = User.find_by_role_id(role.id)
   if user.nil?
   @user = User.new(params[:user])
   if params[:is_login_type_email]
     @user.login = @user.email
   end
   @user.role = role
   @user.is_activated = true
   if @user.save
      # Save all the 6 settings
      # Login / Email Authentication Setting
       setting = Setting.find_by_name("is_login_type_email")
       setting.setting_value = (params[:is_login_type_email].nil? ? "false" : "true")
       setting.save
      # User registration Setting
       setting = Setting.find_by_name("allow_user_register_user")
       setting.setting_value = (params[:allow_user_register_user].nil? ? "false" : "true")
       setting.save
      # Welcome email setting
       setting = Setting.find_by_name("send_welcome_email")
       setting.setting_value = (params[:send_welcome_email].nil? ? "false" : "true")
       setting.save
     # Administrator registration setting
       setting = Setting.find_by_name("allow_admin_register_user")
       setting.setting_value = (params[:allow_admin_register_user].nil? ? "false" : "true")
       setting.save
     # User activation setting
       setting = Setting.find_by_name("user_activation_required_on_user")
       setting.setting_value = (params[:user_activation_required_on_user].nil? ? "false" : "true")
       setting.save
     # Administrator activation setting
       setting = Setting.find_by_name("user_activation_required_on_admin")
       setting.setting_value = (params[:user_activation_required_on_admin].nil? ? "false" : "true")
       setting.save
     
    redirect_to :action => :new
   else
    render :action=>"first_user"
   end
   else
    redirect_to :action => :new
   end
   
end

def new
  unless current_user.nil?
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to :controller => "users", :action => "show", :id => current_user.id
    end
  else
    render :action=>:new
  end
end
 
def create
  if current_user.nil?
     @user = User.find_by_login(params[:login])
     user =User.authenticate(params[:login], params[:password])
     if @user.nil? 
          flash[:notice]="Incorrect Login"
          render :action => :new
     elsif !@user.is_activated
	  flash[:notice]="User not yet activated. Please check your activation email."
          render :action => :new
     elsif user.nil?
          @user.failed_login_count += 1
          @user.save
         flash[:notice]="Login correct Incorrect password"
         render :action => :new
     else
         flash[:notice] = "Login successful!"
         self.current_user = @user
         if params[:remember_me]=="1"
           cookies[:remember_me_code] = {:value => current_user.salt, :expires => 30.days.from_now }
         end
         @user.current_login_ip=request.remote_ip
         @user.last_login_ip=@user.current_login_ip
         @user.login_count+=1 
	 @user.save
         if current_user.admin?
            redirect_to :controller=>"admin",:action=>"dashboard"
         else
            redirect_to :controller => "users", :action => "show", :id => @user.id
         end
     end
 end
end

def forgot
    if request.post?
      user = User.find_by_email(params[:user][:email])
      respond_to do |format|
      if user
        user.create_reset_code
        flash[:notice] = "Reset code sent to #{user.email}"
        format.html { redirect_to login_path }
        format.xml { render :xml => user.email, :status => :created }
      else
        flash[:error] = "#{params[:user][:email]} does not exist in system"
        format.html { redirect_to login_path }
        format.xml { render :xml => user.email, :status => :unprocessable_entity }
        end
      end
    end
end

def destroy
     
    cookies.delete :remember_me_code
    session[:user]=nil
    flash[:notice] = "You have been logged out."
    redirect_to login_path
end



end

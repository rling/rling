class PasswordResetsController < ApplicationController

# GET /password_resets/new
# GET /password_resets/new.xml
def new
 
end

# POST /password_resets
# POST /password_resets.xml
def create
   user = User.find_by_email(params[:user][:email])
   respond_to do |format|
      if user
        user.create_reset_code
        Notifier.forgot_password(user).deliver
        flash[:notice] = "Reset code sent to your email. Follow instructions in the email."
        format.html { redirect_to login_path }
        format.xml { render :xml => user.email, :status => :created }
      else
        flash[:notice] = "#{params[:user][:email]} does not exist in system. Please try again or contact administrator at #{User.admins.first.email}"
        format.html {render :action=>'new'}
        format.xml { render :xml => user.email, :status => :unprocessable_entity }
       end
   end
end

# GET /password_resets/1/reset
# GET /password_resets/1/reset.xml
def reset
    @user = User.find_by_reset_password_key(params[:id]) unless params[:id].nil?
    respond_to do |format|
            format.html #reset.html.erb
            format.xml {render :xml =>@user}
    end
end

# POST /password_resets/change
# POST /password_resets/change.xml
def change
  @user = User.find_by_email_and_reset_password_key(params[:user][:email],params[:user][:reset_password_key])
  if @user.update_attributes(params[:user])
     @user.delete_reset_code
     flash[:notice] ="Password has been changed successfully"
     respond_to do |format|
            format.html {redirect_to login_path}
            format.xml {render :xml =>@user}
      end
  else
     flash[:notice] = "Please verify your password reset key"
     respond_to do |format|
            format.html {render :action => "reset" }
            format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
end
end

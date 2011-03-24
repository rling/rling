class PasswordResetsController < ApplicationController
def new
 
end

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
        flash[:notice] = "#{params[:user][:email]} does not exist in system. Please try again"
        format.html {render :action=>'new'}
        format.xml { render :xml => user.email, :status => :unprocessable_entity }
       end
      end
end

def reset
    @user = User.find_by_reset_password_key(params[:id]) unless params[:id].nil?
end

def change
  @user = User.find_by_email_and_reset_password_key(params[:user][:email],params[:user][:reset_password_key])
  if @user.update_attributes(params[:user])
     @user.delete_reset_code
     flash[:notice] ="password has been changed successfully"
     respond_to do |format|
            format.html {redirect_to login_path}
            format.xml {render :xml =>@user}
      end
  else
     flash[:notice] = "Please verify"
     respond_to do |format|
            format.html {render :action => "reset" }
            format.xml {render :xml =>@user}
      end
    end
end



end

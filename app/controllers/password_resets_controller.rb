class PasswordResetsController < ApplicationController
def new
if request.post?
      user = User.find_by_email(params[:user][:email])
      respond_to do |format|
      if user
        Notifier.forgot_password(user).deliver
        flash[:notice] = "Reset code sent to #{user.email}"
        format.html { redirect_to login_path }
        format.xml { render :xml => user.email, :status => :created }
      else
        flash[:notice] = "#{params[:user][:email]} does not exist in system"
        format.html { redirect_to login_path }
        format.xml { render :xml => user.email, :status => :unprocessable_entity }
       end
      end
    end
end

def reset
    @user = User.find_by_reset_code(params[:reset_code]) unless params[:reset_code].nil?
    if request.post?
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        self.current_user = @user
        @user.delete_reset_code
        flash[:notice] = "Password reset successfully for #{@user.email}"
        redirect_to root_url
      else
        render :action => :reset
      end
    end
  end


def create
  if request.post?
      u= User.find_by_email(params[:user][:email])
      if u and u.send_new_password
        flash[:message]  = "A new password has been sent by email."
       respond_to do |format|
            format.html {redirect_to login_users_path }

            format.xml {render :xml =>@user}
       end
      else
        flash[:warning]  = "Couldn't send password"
        respond_to do |format|
            format.html {render :action => forgot_password_users_path }
            format.xml {render :xml =>@user}
       end
      end
    end
end


def change_password
  u = User.find_by_email(params[:user][:email])
  if u
     Notifier.send_password(u).deliver
     flash[:message] ="email send for reset password"
     respond_to do |format|
            format.html {render :action => reset_pass_users_path }
            format.xml {render :xml =>@user}
      end
  else
     flash[:error] = "there is some problem in email"
     respond_to do |format|
            format.html {render :action => reset_pass_users_path }
            format.xml {render :xml =>@user}
      end
    end
end



end

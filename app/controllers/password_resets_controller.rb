class PasswordResetsController < ApplicationController
def new
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

def reset
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

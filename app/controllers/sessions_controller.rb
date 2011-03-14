class SessionsController < ApplicationController
def first_user
end
def first_user_create
end

 
def new
end


def create
  if params[:user][:login] == ""
     flash[:login]="enter your login"
     render :action=>"login"
  elsif params[:user][:password] == ""
     flash[:password] ="enter your password"
     render :action=>"login"
  else
   if request.post?
      if session[:user] = User.authenticate(params[:user][:login], params[:user][:password])
        if session[:user].activation_key.nil? or session[:user].activation_key.empty?
         if params[:rememberMe] 
           userId = (@user.id).to_s  
           cookies[:remember_me_id] = { :value => userId, :expires => 30.days.from_now }  
           userCode = Digest::SHA1.hexdigest( @user.login )[4,18]  
           cookies[:remember_me_code] = { :value => userCode, :expires => 30.days.from_now } 
        end 
        flash[:message]  = "Login successful"
        respond_to do |format|
            format.html {redirect_to dashboard_index_path }
            format.xml { render :xml =>@user }
        end
        else
          flash[:notice]="please activate your account"
           respond_to do |format|
            format.html {render :action => login_users_path }
            format.xml {render :xml =>@user}
          end
        end
      else
        flash[:warning] = "Opps! there is something wrong"
        render :action=>"login"
      end
    end
 end
end

def destroy
  if cookies[:remember_me_id] then cookies.delete :remember_me_id end 
  if cookies[:remember_me_code] then cookies.delete :remember_me_code end 
  session[:user] = nil
 respond_to do |format|
            format.html {redirect_to home_index_path}
            format.xml {render :xml =>@user}
        end

end
end

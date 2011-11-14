class PasswordResetsController < ApplicationController

# GET /password_resets/new
# GET /password_resets/new.xml
def new

end

# POST /password_resets
# POST /password_resets.xml
def create
   user = User.where(:email=>params[:user][:email]).first
   respond_to do |format|
      if user
        user.create_reset_code
        Notifier.forgot_password(user).deliver
        flash[:notice] = t(:reset_code_sent)
        format.html { redirect_to login_path }
        format.xml { render :xml => user.email, :status => :created }
      else
        flash[:notice] = "#{params[:user][:email]} #{t(:email_dosent_exist)} #{User.admins.first.email}"
        format.html {render :action=>'new'}
        format.xml { render :xml => user.email, :status => :unprocessable_entity }
       end
   end
end

# GET /password_resets/1/reset
# GET /password_resets/1/reset.xml
def reset
    @user = User.where(:reset_password_key=>params[:id]).first unless params[:id].nil?
    respond_to do |format|
            format.html #reset.html.erb
            format.xml {render :xml =>@user}
    end
end

# POST /password_resets/change
# POST /password_resets/change.xml
def change
  @user = User.where(:email=>params[:user][:email],:reset_password_key=>params[:user][:reset_password_key]).first
  if @user.update_attributes(params[:user])
     @user.delete_reset_code
     flash[:notice] = t(:password_changed)
     respond_to do |format|
            format.html {redirect_to login_path}
            format.xml {render :xml =>@user}
      end
  else
     flash[:notice] = t(:verify_reset_key)
     respond_to do |format|
            format.html {render :action => "reset" }
            format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
end
end

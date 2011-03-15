class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :current_user
  filter_parameter_logging :password, :password_confirmation
  before_filter :check_browser,:check_admin
  layout :set_layout
  
  private
       
    def current_user
      return session[:user]
    end
    
    def current_user=(value)
     session[:user] = value
    end

    def current_user?
     return !session[:user].nil?
    end

    def require_user
       unless current_user?
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_session_url
        return false
      end
    end

    def require_no_user
      if current_user?
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end
    
   def require_admin
      unless current_user.admin?
        flash[:notice] = "You do not have administrator previleges to access the page"
        redirect_to :controller => "users", :action => "show", :id => current_user.id
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def check_browser
	if session[:browser].nil?
	  session[:browser] = 1
        browsers = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]
	  useragent = request.headers["HTTP_USER_AGENT"].downcase
        browsers.each do |os|
	  	 if useragent.match(os)
#		    session[:browser]=2
		    break
		 end
	  end
	end	
      
    end
   
   def check_admin
    if session[:admin_found].nil? 
     role = Role.find_by_role_type("Admin")
     if role.users.size > 0
	session[:admin_found] = true
     else
	     if params[:controller]!="sessions" && (params[:action] != "first_user" || params[:action] != "first_user_create")
		     redirect_to first_user_sessions_path
     	     end
     end
    end
   end

    def set_layout
		return (session[:browser] == 2) ? "mobile_application" : "application" 
    end 
end

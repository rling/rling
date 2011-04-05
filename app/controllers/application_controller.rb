class ApplicationController < ActionController::Base
  include Userstamp
  protect_from_forgery
  helper :all
  helper_method :current_user,:current_user?
  before_filter :check_browser,:check_admin,:check_cookie
  layout :set_layout
   
  def verify_permission

      activities = {"new"=>"create","edit"=>"edit","destroy"=>"delete","show"=>"view","index"=>"viewlist"}
      activity = activities[params[:action]]
      if["edit" , "delete"].include?(activity)
        if current_user.nil?
         activity = "#{activity}other"
        else
         @model_submission =  @object.model_submissions.find(params[:id])
         if(@model_submission.creator_id != current_user.id)
           activity = "#{activity}other"
         end
       end
      end

      unless activity.nil?
        permission_type = @object.class.to_s
        permission_object = @object.name
        permission = Permission.find(:first,:conditions=>["permission_type=? and permission_object=? and activity_code=?",permission_type,permission_object,activity])
        role_id = current_user.nil? ? 1 : current_user.role_id
        permissionrole = PermissionRole.find(:first,:conditions=>["permission_id=? and role_id=?",permission.id,role_id])
        if permissionrole.nil? || !permissionrole.value
           redirect_to :controller=>"display",:action=>"no_permissions"
        end
      end
    end

    def current_user
      return session[:user]
    end
    
    def current_user=(value)
     session[:user] = value
    end

    def current_user?
     return !session[:user].nil?
    end

    def check_cookie
     unless current_user?
       unless cookies[:remember_me_code].nil?
          u = User.find(:first,:conditions=>["salt=?",cookies[:remember_me_code]])
          self.current_user = u unless u.nil?
        end
     end
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
        unless request.headers["HTTP_USER_AGENT"].nil?
        browsers = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]
	  useragent = request.headers["HTTP_USER_AGENT"].downcase
        browsers.each do |os|
	  	 if useragent.match(os)
		    session[:browser]=2
		    break
		 end
	  end
	end	
      end
    end
   
   def check_admin
    if session[:admin_found].nil? 
     role = Role.find_by_role_type("Administrator")
      unless role.nil?
     if role.users.size > 0
	session[:admin_found] = true
     else
	     if params[:controller]!="sessions" && (params[:action] != "first_user" || params[:action] != "first_user_create")
		     redirect_to first_user_sessions_path
     	     end
     end
    end
    end
   end

    def set_layout
		return (session[:browser] == 2) ? "mobile_application" : "application" 
    end

   
end

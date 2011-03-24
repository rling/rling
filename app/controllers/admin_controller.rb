class AdminController < ApplicationController
before_filter :require_user, :require_admin

def dashboard

end 

def clear_cache
  root_path = Rails.root.to_s + "/tmp/cache"
  entries = Dir.entries(root_path)
  entries.each do |entry|
   unless (entry == "." || entry == "..")
       FileUtils.rm_rf(root_path + "/"+ entry)
   end
  end
  flash[:notice] = "Cache is empty."
  respond_to do |format|
      format.html { redirect_to(:action=>'dashboard',:controller=>'admin') }
      format.xml  { head :ok }
    end 
  end

end

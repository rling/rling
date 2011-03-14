class AdminController < ApplicationController
before_filter :require_user, :require_admin

  def index
   redirect_to :action=>"dashboard"
  end

  def dashboard
  end
end

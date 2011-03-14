class DisplayController < ApplicationController
#cache_sweeper :page_sweeper, :only => [:show_page]

  def index
   @pages = Page.find_all_by_home_page(true,:conditions => ["page_view_type IN (?)",["0","1"]])   
  end

  def mobile_index
   @pages = Page.find_all_by_home_page(true,:conditions => ["page_view_type IN (?)",["0","2"]])   
  end

  def show_page
    @page = Page.find_by_perma_link("/"+params[:permalink])
   if @page.nil?
     redirect_to :action=>"error_page_display"
   end
   #if $USE_SHADOW
   #  render :layout=>false
   #end
  end
  
  def error_page_display

  end 
end

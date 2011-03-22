class PagesController < ApplicationController
cache_sweeper :page_sweeper,  :only => [:create, :update, :destroy]

include PermalinkHelper
  # GET /pages
  # GET /pages.xml
  before_filter :require_user, :require_admin
  #before_filter :require_admin,:except=>[:edit,:update,:destroy,:show]

  def index
    @pages = Page.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
    @menu = Menu.find_by_page_id(@page.id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
    if params[:permalnk] == "1"
     @page.perma_link_generate
    end
    @page.home_page = params[:home_page]
    respond_to do |format|
      if @page.save
          unless params[:page_variables].nil?
	  update_page_variables(params[:page_variables],@page)
          end
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update 
    @page = Page.find(params[:id])
    if params[:permalnk] == "1"
   	@page.perma_link_generate
    end
    
    unless params[:page][:menu_name].empty?
	    menu = Menu.find_by_page_id(@page.id)
	    if menu.nil?
	     menu = Menu.new
	    end
	    menu.name = params[:page][:menu_name]
	    menu.parent_id = params[:page][:menu_parent_id]
	    menu.page_id = @page.id
            menu.menu_view_type = params[:page][:page_view_type]
	    menu.save
    end
    respond_to do |format|
      if @page.update_attributes(params[:page])
   	  unless params[:page_variables].nil?
	  update_page_variables(params[:page_variables],@page)
          end
         @page.home_page = params[:home_page] 
         @page.save
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
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
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end 
  end
    
  
  
private 

def update_page_variables(page_variables,page)
 page_variables.each do |k,v|
  pv = PageVariable.find_by_page_id_and_page_variable_setting_id(page.id,k)
  if pv.nil?
   pv = PageVariable.new
   pv.page_id = page.id
   pv.page_variable_setting_id = k.to_i
  end
  pv.variable_value = v
  pv.save
 end 
end

end

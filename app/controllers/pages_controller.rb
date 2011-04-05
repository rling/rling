class PagesController < ApplicationController
cache_sweeper :page_sweeper,  :only => [:create, :update, :destroy]
include PermalinkHelper
  # GET /pages
  # GET /pages.xml
  before_filter :require_user, :require_admin
  
  def index
    @pages = Page.pages
    respond_to do |format|
      format.html # index.html.erb
     # format.xml  { render :xml => @pages }
    end
  end
  
  def object_form_index
      @pages = Page.object_forms
      respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @pages }
    end
  end
   def view_index
      @pages = Page.views
      respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @pages }
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
   @page_type='Page'
    @page = Page.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

   def new_object_form
   @page_type='ObjectForm'
   @page = ObjectForm.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

    def new_view
   @page_type='View'
   @page = View.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end


  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
    @page_type = "Page"
    @page_type = "ObjectForm" if @page.type == "ObjectForm"
    @page_type = "View"   if @page.type == "View"
  end

  # POST /pages
  # POST /pages.xml
  def create
      @page_type= params[:page_type]
      if @page_type == "ObjectForm"
        @page =ObjectForm.new(params[:object_form])
      elsif @page_type == "View"
        @page = View.new(params[:view])
      else
         @page =Page.new(params[:page])
      end 
      if params[:permalnk] == "1"
           @page.perma_link_generate
      end
        @page.home_page = params[:home_page]  
   
    respond_to do |format|
      if @page.save
          unless params[:page_variables].nil?
	  update_page_variables(params[:page_variables],@page)
          end
        flash[:notice] = "#{@page_type} was successfully created."
      
        format.html { redirect_to(:action=>'show',:id=>@page) }
        #format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
    
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update 
    @page_type = params[:page_type]
    page_params = params[:page]
    if @page_type == "ObjectForm"
     page_params = params[:object_form]
    end
     if @page_type == "View"
        page_params = params[:view]
     end
    @page = Page.find(params[:id])
    if params[:permalnk] == "1"
   	@page.perma_link_generate
    end
     unless page_params[:menu_name].nil?
     unless page_params[:menu_name].empty?
	    menu = Menu.find_by_page_id(@page.id)
	    if menu.nil?
	     menu = Menu.new
	    end
	    menu.name = page_params[:menu_name]
	    menu.parent_id = page_params[:menu_parent_id]
	    menu.page_id = @page.id
            menu.menu_view_type = page_params[:page_view_type]
	    menu.save
     end
     end
    respond_to do |format|
      if @page.update_attributes(page_params)
   	  unless params[:page_variables].nil?
	  update_page_variables(params[:page_variables],@page)
          end
         @page.home_page = params[:home_page] 
         @page.save
        flash[:notice] = "#{@page_type} was successfully updated."
        format.html { redirect_to(:action=>'show' ,:id=>@page) }
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
    Page.delete(params[:id])
    respond_to do |format|
      format.html { redirect_to((@page.type == "ObjectForm" ? object_form_index_pages_url : pages_url)) }
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

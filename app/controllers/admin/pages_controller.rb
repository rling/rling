class Admin::PagesController < ApplicationController

#SWEEPER
cache_sweeper :page_sweeper,  :only => [:create, :update, :destroy]

#FILTER
before_filter :require_admin


  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.pages
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/object_form_index
  # GET /pages/object_from_index.xml
  def object_form_index
      @pages = Page.object_forms
      respond_to do |format|
      format.html # object_form_index.html.erb
      format.xml  { render :xml => @pages }
      end
  end

  # GET /pages/view_index
  # GET /pages/view_index.xml
   def view_index
      @pages = Page.views
      respond_to do |format|
      format.html # view_index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/category_view_index
  # GET /pages/category_view_index.xml
   def category_view_index
      @pages = Page.category_views
      respond_to do |format|
      format.html # category_view_index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
     if params[:id].to_i == 0
      @page = Page.find_by_perma_link(params[:id])
     else
      @page = Page.find_by_id(params[:id])
     end
    @menu = Menu.find_by_page_id(@page.id)
    @categoryset=Categoryset.find_by_id(@page.view_for)
    @associated=Page.find_by_id(@page.associated_view)
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


  # GET /pages/new_object_form
  # GET /pages/new_object_form.xml
   def new_object_form
   @page_type='ObjectForm'
   @page = ObjectForm.new
    respond_to do |format|
      format.html # new_object_form.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new_view
  # GET /pages/new_view.xml
  def new_view
   @page_type='View'
   @page = View.new
    respond_to do |format|
      format.html # new_view.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new_category_view
  # GET /pages/new_category_view.xml
  def new_category_view
   @page_type='CategoryView'
   @page = CategoryView.new
    respond_to do |format|
      format.html # new_category_view.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
    @page_type = "Page"
    @page_type = "ObjectForm" if @page.type == "ObjectForm"
    @page_type = "View"   if @page.type == "View"
    @page_type = "CategoryView" if @page.type == "CategoryView"
  end

  # POST /pages
  # POST /pages.xml
  def create
      @page_type= params[:page_type]
      if @page_type == "ObjectForm"
        @page_type='Form'
        @page =ObjectForm.new(params[:object_form])
      elsif @page_type == "View"
         @page = View.new(params[:view])
      elsif @page_type == "CategoryView"
         @page = CategoryView.new(params[:category_view])
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
        flash[:notice] = "#{@page_type} #{t(:page_created)}"
        format.html { redirect_to(:action=>'show',:id=>@page) }
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
    @page_type = params[:page_type]
    page_params = params[:page]
    if @page_type == "ObjectForm"
      @page_type="Form"
      page_params = params[:object_form]
    end
    if @page_type == "View"
      page_params = params[:view]
    end
    if @page_type== "CategoryView"
      page_params = params[:category_view]
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
        flash[:notice] ="#{@page_type} #{t(:page_updated)}"
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
    @page.type='Page' if @page.type==nil
    @page.type='Form' if @page.type=='ObjectForm'
    flash[:notice]="#{@page.type} #{t(:page_deleted)}"
    @page.destroy
    respond_to do |format|
      format.html { redirect_to((@page.type == "CategoryView" ? category_view_index_pages_url : @page.type == "Form" ? object_form_index_pages_url : (@page.type == "View" ? view_index_pages_url : pages_url))) }
      format.xml  { head :ok }
    end
  end

  # GET /pages/query
  # GET /pages/query.xml
 def query
  @page = Page.find(params[:id])
  respond_to do |format|
      format.html #query.html.erb
      format.xml  { render :xml=>@page}
  end
 end
 
  # POST /pages/create_query
  # POST /pages/create_query.xml
 def create_query
    page=Page.find_by_id(params[:view_id])
   if  page.update_attributes(params[:view])
      flash[:notice] = t(:query_stored)
      respond_to do |format|
        format.html {redirect_to (view_index_pages_path)}
        format.xml  { render :xml=>page}
      end
   else
     flash[:notice] = t(:error_in_page)
     respond_to do |format|
        format.html {redirect_to (view_index_pages_path)}
        format.xml  { render :xml=>page.errors ,:status => :unprocessable_entity}
      end
   end
 end
    
private 

#UPDATE PAGE VARIABLES AFTER CREATE AND UPDATE OF PAGES IF ANY
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

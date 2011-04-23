class Admin::ViewOrdersController < ApplicationController
#Filters
  before_filter :require_admin
 before_filter :get_view
  # GET /view_orders
  # GET /view_orders.xml
  def index
    @view_orders = @page.view_orders.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @view_orders }
    end
  end

  # GET /view_orders/1
  # GET /view_orders/1.xml
  def show

    @view_order =  @page.view_orders.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @view_order }
    end

  end

  # GET /view_orders/new
  # GET /view_orders/new.xml
  def new
   @view_order =  @page.view_orders.new
   respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @view_order }
    end
  end

  # GET /view_orders/1/edit
  def edit
    @view_order =  @page.view_orders.find(params[:id])
  end

  # POST /view_orders
  # POST /view_orders.xml
  def create
    @view_order =  @page.view_orders.new(params[:view_order])

    respond_to do |format|
      if @view_order.save
        format.html { redirect_to([@page,@view_order], :notice => 'View order was successfully created.') }
        format.xml  { render :xml => @view_order, :status => :created, :location => @view_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @view_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /view_orders/1
  # PUT /view_orders/1.xml
  def update
    @view_order =  @page.view_orders.find(params[:id])

    respond_to do |format|
      if @view_order.update_attributes(params[:view_order])
        format.html { redirect_to([@page,@view_order], :notice => 'View order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @view_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /view_orders/1
  # DELETE /view_orders/1.xml
  def destroy
    @view_order =  @page.view_orders.find(params[:id])
    @view_order.destroy

    respond_to do |format|
      format.html { redirect_to(view_view_orders_url) }
      format.xml  { head :ok }
    end
  end

  private
  # Get the View (Page Object) to which the conditions are associated to.
  def get_view
  @page=View.find_by_id(params[:view_id])
  end
end

class MailersController < ApplicationController
  before_filter :require_user,:require_admin
  # GET /mailers
  # GET /mailers.xml
  def index
    @mailers = Mailer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mailers }
    end
  end

  # GET /mailers/1
  # GET /mailers/1.xml
  def show
    @mailer = Mailer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mailer }
    end
  end

  # GET /mailers/new
  # GET /mailers/new.xml
  def new
    @mailer = Mailer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mailer }
    end
  end

  # GET /mailers/1/edit
  def edit
    @mailer = Mailer.find(params[:id])
  end

  # POST /mailers
  # POST /mailers.xml
  def create
    @mailer = Mailer.new(params[:mailer])

    respond_to do |format|
      if @mailer.save
        format.html { redirect_to(@mailer, :notice => 'Mailer was successfully created.') }
        format.xml  { render :xml => @mailer, :status => :created, :location => @mailer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mailer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mailers/1
  # PUT /mailers/1.xml
  def update
    @mailer = Mailer.find(params[:id])

    respond_to do |format|
      if @mailer.update_attributes(params[:mailer])
        format.html { redirect_to(@mailer, :notice => 'Mailer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mailer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mailers/1
  # DELETE /mailers/1.xml
  def destroy
    @mailer = Mailer.find(params[:id])
    @mailer.destroy

    respond_to do |format|
      format.html { redirect_to(mailers_url) }
      format.xml  { head :ok }
    end
  end
end

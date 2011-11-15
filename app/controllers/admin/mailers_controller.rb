class Admin::MailersController < ApplicationController
  #FILTERS
  before_filter :find_mailer, :only => [:show, :edit, :update, :destroy, :sendmail]
  before_filter :require_admin

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
    #@mailer = Mailer.find(params[:id])
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
    #@mailer = Mailer.find(params[:id])
  end

  # POST /mailers
  # POST /mailers.xml
  def create
    @mailer = Mailer.new(params[:mailer])
    respond_to do |format|
      if @mailer.save
        format.html { redirect_to(@mailer, :notice => t(:mailer_created)) }
        format.xml  { render :xml => @mailer, :status => :created, :location => @mailer }
      else
        format.html { render  "new" }
        format.xml  { render :xml => @mailer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mailers/1
  # PUT /mailers/1.xml
  def update
    #@mailer = Mailer.find(params[:id])
    respond_to do |format|
      if @mailer.update_attributes(params[:mailer])
        format.html { redirect_to(@mailer, :notice => t(:mailer_updated)) }
        format.xml  { head :ok }
      else
        format.html { render  "edit" }
        format.xml  { render :xml => @mailer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mailers/1
  # DELETE /mailers/1.xml
  def destroy
    #@mailer = Mailer.find(params[:id])
    unless @mailer.is_deletable
      flash[:notice] = t(:standard_mails_required)
    else
          @mailer.destroy
    end
    respond_to do |format|
      format.html { redirect_to(mailers_url) }
      format.xml  { head :ok }
    end
  end

  # GET /mailers/1/sendmail
  # GET /mailers/1/sendmail.xml
  def sendmail
   # @mailer = Mailer.find(params[:id])
    respond_to do |format|
      format.html # sendmail.html.erb
      format.xml  { render :xml => @mailer }
    end
  end

  # POST /mailers/1/preparemail
  # GET /mailers/1/preparemail.xml
  def preparemail
    mailer = params[:mailer]
    if mailer[:to].blank? && mailer[:cc].blank? && mailer[:bcc].blank?
      flash[:notice] = t(:email_address_required)
      respond_to do |format|
        format.html { redirect_to :back }
        format.xml  { head :ok }
      end
    else
      Notifier.send_mailers_email(mailer[:to],mailer[:cc],mailer[:bcc],mailer[:subject],mailer[:body]).deliver
      flash[:notice]=t(:email_sent_successfully)
      respond_to do |format|
        format.html { redirect_to(mailers_url) }
        format.xml  { head :ok }
      end
    end
  end
 private
  def find_mailer
     @mailer = Mailer.find(params[:id])
  end
end

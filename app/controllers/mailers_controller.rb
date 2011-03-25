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

    unless @mailer.is_deletable
      flash[:notice] = "Cannot delete standard mailers"
    else
          @mailer.destroy
    end

    respond_to do |format|
      format.html { redirect_to(mailers_url) }
      format.xml  { head :ok }
    end
  end

  def sendmail
    @mailer = Mailer.find(params[:id])
  end
  def preparemail
    mailer = params[:mailer]
    if mailer[:to].blank? && mailer[:cc].blank? && mailer[:bcc].blank?
      flash[:notice] = "Needs atleast one email address in to, cc or bcc feilds"
      redirect_to :back
    else
      Notifier.send_mailers_email(mailer[:to],mailer[:cc],mailer[:bcc],mailer[:subject],mailer[:body]).deliver
      flash[:notice]="Mail sent to given emails successfully"
      redirect_to mailers_path
    end
  end
end

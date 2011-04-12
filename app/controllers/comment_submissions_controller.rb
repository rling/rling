class CommentSubmissionsController < ApplicationController

  before_filter :require_admin
  before_filter :get_model
  # GET /comment_submissions
  # GET /comment_submissions.xml
  def index
    @comment_submissions =@model.comment_submissions.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comment_submissions }
    end
  end

  # GET /comment_submissions/1
  # GET /comment_submissions/1.xml
  def show
    @comment_submission = @model.comment_submissions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment_submission }
    end
  end

  # GET /comment_submissions/new
  # GET /comment_submissions/new.xml
  def new
    @comment_submission = @model.comment_submissions.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment_submission }
    end
  end

  # GET /comment_submissions/1/edit
  def edit
    @comment_submission =@model.comment_submissions.find(params[:id])
  end

  # POST /comment_submissions
  # POST /comment_submissions.xml
  def create
    @comment_submission = @model.comment_submissions .new(params[:comment_submission])

    respond_to do |format|
      if @comment_submission.save
        format.html { redirect_to([@model,@comment_submission], :notice => 'Comment submission was successfully created.') }
        format.xml  { render :xml => @comment_submission, :status => :created, :location => @comment_submission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment_submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comment_submissions/1
  # PUT /comment_submissions/1.xml
  def update
    @comment_submission =@model.comment_submissions.find(params[:id])

    respond_to do |format|
      if @comment_submission.update_attributes(params[:comment_submission])
        format.html { redirect_to([@model,@comment_submission], :notice => 'Comment submission was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment_submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_submissions/1
  # DELETE /comment_submissions/1.xml
  def destroy
    @comment_submission = @model.comment_submissions.find(params[:id])
    @comment_submission.destroy

    respond_to do |format|
      format.html { redirect_to(model_submission_comment_submissions_url) }
      format.xml  { head :ok }
    end
  end

  def get_model_submission
     @model=ModelSubmission.find(params[:model_submission_id])
   end
end

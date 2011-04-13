class CommentSubmissionsController < ApplicationController
 include DisplayHelper
  before_filter :require_admin
  before_filter :get_model_submission
  # GET /comment_submissions
  # GET /comment_submissions.xml
  def index
    @comment_submissions =get_all_comments(CommentSubmission.new,@model)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comment_submissions }
    end
  end

  
  # DELETE /comment_submissions/1
  # DELETE /comment_submissions/1.xml
  def destroy
    @comment_submission = @model.comment_submissions.find(params[:id])
    @comment_submission.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end

  def get_model_submission
     @object=ObjectModel.find(params[:object_model_id])
     @model=ModelSubmission.find_by_id_and_object_model_id(params[:model_submission_id],@object.id)
   end
end

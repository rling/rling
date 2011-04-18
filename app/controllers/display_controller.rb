class DisplayController < ApplicationController
include ApplicationHelper

#ALL ACTIONS OF DISPLAY CONTROLLER ARE ROUTED THROUGH MATCHES RATHER THAN RESOURCES
#DISPLAY CONTROLLER IS NOT CONROLLED BY RESOURCES. THIS IS NOT AN RESTFUL CONTROLLER

  # ROOT :to => "display#index"
  # HOME PAGE OF THE WEBSITE
  def index
   @pages = Page.find_all_by_home_page(true)
   @models=ModelSubmission.find_all_by_home_page(true)
  end
  
  # MATCH "/:permalink"=> "display#show_page"
  # DISPLAY ALL THE PAGES / FORMS / VIEWS IDENTIFIED BY THE PERMALINK
  def show_page
    @page = Page.find_by_perma_link(params[:permalink])
      if @page.nil?
        redirect_to :action=>"error_page_display"
      end
    render :layout=>@page.layout unless @page.blank? || @page.layout.blank? || !File.exists?("#{RAILS_ROOT}/app/views/layouts/#{@page.layout}.erb")
  end

   # MATCH "/:permalinkparent/:permalink"=> "display#show_model_data"
   # DISPLAY ALL THE MODEL SUBMISSIONS FOR GIVEN PERMALINK AND ITS PARENT
   def show_model_data
    @object= ObjectModel.find_by_perma_link_parent(params[:permalinkparent])
    @model_submission= nil
    if @object.nil?
      redirect_to :action=>"error_page_display"
    else
     if validate_permission("view",@object)
         @model_submission=ModelSubmission.find_by_perma_link_and_object_model_id(params[:permalink],@object.id)
         redirect_to :action=>"error_page_display" if @model_submission.nil?
         @comment_submission=@model_submission.comment_submissions.new if !@model_submission.object_model.allow_comments && !@model_submission.object_model.comment_components.empty?        
     else
       redirect_to :action=>"no_permissions"
     end
    end
    render :layout=>@object.layout if !(@object.nil? || @model_submission.nil?) && !@object.layout.blank? && File.exists?("#{RAILS_ROOT}/app/views/layouts/#{@object.layout}.erb") 
  end
  
  #MATCH "display/error_page_display"=>"display#error_page_display"
  #DISPLAY THIS PAGE IN CASE OF ANY ERROR THAT HAS BEEN HANDLED FOR OTHERS GO TO 404
  def error_page_display

  end

  #MATCH "display/no_permissions"=>"display#no_permissions"
  #DISPLAY THIS PAGE IN CASE OF VIOLATION OF ANY PERMISSIONS AS CAUGHT BY THE SYSTEM
  def no_permissions

  end

  #MATCH "display/create_submissions/:id"=>"display#create_submissions"
  #THIS ACTION IS CALLED WHEN A FORM HAS BEEN SUBMITTED FROM THE FRONT END
  def create_submissions
    object_form = ObjectForm.find(params[:id])
    message= "Your details have been submitted successfully"
    if object_form.nil?
      message= "Could not submit your details. Please try again"
    else
      form_data = params[:form_field]
      mandatoryfailed = false
      object_form.form_components.each do |component|
        if component.mandatory && form_data[component.component_name].blank?
          mandatoryfailed = true
          break;
        end
      end
      unless mandatoryfailed
        submission = FormSubmission.create(:object_form_id=>object_form.id)
        object_form.form_components.each do |component|
        case component.component_type
          when "File"
            unless form_data[component.component_name].nil?
              asset = Asset.create(:sizes=>component.default_value,:upload=>form_data[component.component_name])
              FormData.create(:form_submission_id=>submission.id,:form_component_id=>component.id,:data_value=>asset.id.to_s)
            end
        else
            FormData.create(:form_submission_id=>submission.id,:form_component_id=>component.id,:data_value=>form_data[component.component_name])
        end
        end
        message = "All details have been stored successfully"
        Notifier.form_submitted(submission).deliver unless object_form.email.blank?
      else
        message = "Ensure you have added all the mandatory fields"
      end
    end
    flash[:notice] = message
    redirect_to :back
  end

  #MATCH  "display/create_comment_submissions/:id"=>"display#create_comment_submissions"
  #THIS ACTION IS CALLED WHEN A COMMENT HAS BEEN SUBMITTED TO ANY MODEL SUBMISSION
  def create_comment_submissions
    model_submission = ModelSubmission.find(params[:id])
  #if validate_permission("create",model_submission.object_model)
    message= "Your details have been submitted successfully"
    if model_submission.nil?
      message= "Could not submit your details. Please try again"
    else
      comment_data = params[:form_field]
      mandatoryfailed = false
      model_submission.object_model.comment_components.each do |component|
        if component.mandatory && comment_data[component.component_name].blank?
          mandatoryfailed = true
          break;
        end
      end
      unless mandatoryfailed
        submission = CommentSubmission.new(:model_submission_id=>model_submission.id )
        submission.parent_id=params[:parent_id]
        submission.save
        model_submission.object_model.comment_components.each do |component|
        case component.component_type
          when "File"
            unless form_data[component.component_name].nil?
              asset = Asset.create(:sizes=>component.default_value,:upload=>form_data[component.component_name])
              CommentData.create( :comment_submission_id=>submission.id,:comment_component_id=>component.id,:data_value=>asset.id.to_s)
            end
        else
            CommentData.create(:comment_submission_id=>submission.id,:comment_component_id=>component.id,:data_value=>comment_data[component.component_name])
        end
        end
        message = "All details have been stored successfully"
        submission.send_email
      else
        message = "Ensure you have added all the mandatory fields"
      end
    end
    flash[:notice] = message
    redirect_to :back
  end
  # end
end

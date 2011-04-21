class DisplayController < ApplicationController 
 #Includes
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
    @sort= params[:sort]
    @order= params[:order]
    @category = params[:category]
    @page = Page.find_by_perma_link_and_status(params[:permalink],:published)
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
         @model_submission=ModelSubmission.find_by_perma_link_and_object_model_id_and_status(params[:permalink],@object.id,:published)
         redirect_to :action=>"error_page_display" if @model_submission.nil?
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

  #MATCH "display/search_result"=>"display#search_result"
  #DISPLAY All the search results that occur for given search keyword
  def search_result
    @type = params[:type]
    @type = "all" if @type.nil?
    @query = params[:search]
    @results = []
    @msg = ""
    if request.post?
    unless @query.blank?
    case @type.downcase
      when "all"
        @results = @results + Page.find(:all, :conditions => ['title LIKE ? or body LIKE ? and status=?',"%#{@query}%", "%#{@query}%","Published"])
        # Search for all models for information in title and body
        ObjectModel.all.each do |model|
          title = model.model_components.find_by_component_name("title")
          body = model.model_components.find_by_component_name("body")
          model_data = ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{@query}%",title.id])
          model_data = model_data + ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{@query}%",body.id])
          model_data.each do |md|
            ms = md.model_submission
            @results << ms if ms.status == "Published" && !@results.include?(ms)
          end
        end
      when "page"
        # Search only page
        @results = @results + Page.find(:all, :conditions => ['title LIKE ? or body LIKE ? and status=?',"%#{@query}%", "%#{@query}%","Published"])
      when ""
        # No Search
      else
        # GET THE TYPE NAME i.e. BLOGS object model
        # GET all the model submissions for that object model
        # Search for those model submissions
        model = ObjectModel.find_by_name(@type)
        unless model.nil?
          title = model.model_components.find_by_component_name("title")
          body = model.model_components.find_by_component_name("body")
          model_data = ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{@query}%",title.id])
          model_data = model_data + ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{@query}%",body.id])
          model_data.each do |md|
            ms = md.model_submission
            @results << ms if ms.status == "Published" && !@results.include?(ms)
          end
        end
      end
      @msg = "You have #{@results.size} results for the given search query"
    else
      @msg = "Search query found empty, Provide the search text that you want to test"
    end
    else
      @msg = "Enter your search criteria in the given text field and submit"
    end
  end


  #MATCH "display/create_submissions/:id"=>"display#create_submissions"
  #THIS ACTION IS CALLED WHEN A FORM HAS BEEN SUBMITTED FROM THE FRONT END
  def create_submissions
    object_form = ObjectForm.find(params[:id])
    message= "Your details have been submitted successfully"
    if object_form.nil?
      message= "Could not submit your details. Please try again"
    else
      form_datum = params[:form_field]
      mandatoryfailed = false
      object_form.form_components.each do |component|
        if component.mandatory && form_datum[component.component_name].blank?
          mandatoryfailed = true
          break;
        end
      end
      unless mandatoryfailed
        submission = FormSubmission.create(:object_form_id=>object_form.id)
        object_form.form_components.each do |component|
        case component.component_type
          when "File"
            unless form_datum[component.component_name].nil?
              asset = Asset.create(:sizes=>component.default_value,:upload=>form_datum[component.component_name])
              FormDatum.create(:form_submission_id=>submission.id,:form_component_id=>component.id,:data_value=>asset.id.to_s)
            end
        else
            FormDatum.create(:form_submission_id=>submission.id,:form_component_id=>component.id,:data_value=>form_datum[component.component_name])
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
              unless comment_data[component.component_name].nil?
                asset = Asset.create(:sizes=>component.default_value,:upload=>comment_data[component.component_name])
                CommentDatum.create( :comment_submission_id=>submission.id,:comment_component_id=>component.id,:data_value=>asset.id.to_s)
              end
          else
            CommentDatum.create(:comment_submission_id=>submission.id,:comment_component_id=>component.id,:data_value=>comment_data[component.component_name])
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
   def update_view
     id=params[:view_id]
     page=Page.find_by_id(id)
     page.update_attributes(:default_sort_order=>params[:default_sort_order],:default_sort_order_value=>params[:default_sort_order_value],:limit=>params[:limit])
     redirect_to :back
   end
end

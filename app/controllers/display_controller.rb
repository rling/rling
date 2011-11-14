class DisplayController < ApplicationController
 #Includes
 include ApplicationHelper

#ALL ACTIONS OF DISPLAY CONTROLLER ARE ROUTED THROUGH MATCHES RATHER THAN RESOURCES
#DISPLAY CONTROLLER IS NOT CONROLLED BY RESOURCES. THIS IS NOT AN RESTFUL CONTROLLER

  # ROOT :to => "display#index"
  # HOME PAGE OF THE WEBSITE
  def index
   @pages = Page.where(:home_page=>true,:status=>:published)
   @models=ModelSubmission.where(:home_page=>true,:status=>:published)
  end

  # MATCH "/:permalink"=> "display#show_page"
  # DISPLAY ALL THE PAGES / FORMS / VIEWS IDENTIFIED BY THE PERMALINK
  def show_page
    @sort= params[:sort]
    @order= params[:order]
    @category = params[:category]
    @page = Page.where(:perma_link=>params[:permalink],:status=>:published).first
      if @page.nil?
        redirect_to :action=>"error_page_display"
      end
    render :layout=>@page.layout unless @page.blank? || @page.layout.blank? || !File.exists?("#{Rails.root.to_s}/app/views/layouts/#{@page.layout}.erb")
  end

   # MATCH "/:permalinkparent/:permalink"=> "display#show_model_data"
   # DISPLAY ALL THE MODEL SUBMISSIONS FOR GIVEN PERMALINK AND ITS PARENT
   def show_model_data
    @object= ObjectModel.where(:perma_link_parent=>params[:permalinkparent]).first
    @model_submission= nil
    if @object.nil?
      redirect_to :action=>"error_page_display"
    else
      if validate_permission("view",@object)
        @model_submission=ModelSubmission.where(:perma_link=>params[:permalink],:object_model_id=>@object.id,:status=>:published).first
        redirect_to :action=>"error_page_display" if @model_submission.nil?
      else
        redirect_to :action=>"no_permissions"
      end
    end
    render :layout=>@object.layout if !(@object.nil? || @model_submission.nil?) && !@object.layout.blank? && File.exists?("#{Rails.root.to_s}/app/views/layouts/#{@object.layout}.erb")
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
     @query = checkforjs(@query)
    case @type.downcase
      when "all"
        @results = @results + Page.find(:all, :conditions => ['title LIKE ? or body LIKE ? and status=?',"%#{@query}%", "%#{@query}%","Published"])
        # Search for all models for information in title and body
        ObjectModel.all.each do |model|
          title = model.model_components.where(:component_name=>"title").first
          body = model.model_components.where(:component_name=>"body").first
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
          title = model.model_components.where(:component_name=>"title").first
          body = model.model_components.where(:component_name =>"body").first
          model_data = ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{@query}%",title.id])
          model_data = model_data + ModelData.find(:all,:conditions=>["data_value LIKE ? and model_component_id=?", "%#{@query}%",body.id])
          model_data.each do |md|
            ms = md.model_submission
            @results << ms if ms.status == "Published" && !@results.include?(ms)
          end
        end
      end
      @msg = "#{t(:search_string)} #{@results.size} #{t(:search_result)}"
    else
      @msg = t(:search_found_empty)
    end
    else
      @msg = t(:enter_search_criteria)
    end
  end


  #MATCH "display/create_submissions/:id"=>"display#create_submissions"
  #THIS ACTION IS CALLED WHEN A FORM HAS BEEN SUBMITTED FROM THE FRONT END
  def create_submissions
    object_form = ObjectForm.find(params[:id])
    message= t(:object_form_submitted)
    if object_form.nil?
      message= t(:error_in_object_form)
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
        message = t(:object_form_stored)
        Notifier.form_submitted(submission).deliver unless object_form.email.blank?
      else
        message = t(:mandatory_fields_required)
      end
    end
    flash[:notice] = message
    redirect_to :back
  end

  #MATCH  "display/create_comment_submissions/:id"=>"display#create_comment_submissions"
  #THIS ACTION IS CALLED WHEN A COMMENT HAS BEEN SUBMITTED TO ANY MODEL SUBMISSION
  def create_comment_submissions
    model_submission = ModelSubmission.find(params[:id])
    message= t(:comment_submission)
    if model_submission.nil?
      message= t(:error_in_comment_submission)
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
            CommentDatum.create(:comment_submission_id=>submission.id,:comment_component_id=>component.id,:data_value=>checkforjs(comment_data[component.component_name]))
          end
        end
        message = t(:comment_submission_stored)
        submission.send_email
      else
        message = t(:mandatory_fields_required)
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

 #MATCH  "profile/:id"=>"display/profile"
 #THIS ACTION IS CALLED WHEN A USER CLICKS ON THE NAME OF CREATOR OF A POST(BLOG)
  def profile
    setting = Setting.find_by_name("allow_view_user_account")
    if setting.setting_data
      @user= User.find_by_id(params[:id])
      if @user.nil?
        flash[:notice] = t(:user_not_found)
        redirect_to :action=>"error_page_display"
        return
      end
      @user_detail_settings=UserDetailSetting.all
    else
      redirect_to :action=>"error_page_display"
    end
  end
end

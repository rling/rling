class DisplayController < ApplicationController
include ApplicationHelper
  def index
    @pages = Page.find_all_by_home_page(true,:conditions => ["page_view_type IN (?)",["0","1"]])
    @models=ModelSubmission.find_all_by_home_page(true,:conditions => ["page_view_type IN (?)",["0","1"]])
  end

  def mobile_index
    @pages = Page.find_all_by_home_page(true,:conditions => ["page_view_type IN (?)",["0","2"]])
  end

  def show_page
    @page = Page.find_by_perma_link("/"+params[:permalink])
      unless @page.nil?
        if  @page.type.eql?('ObjectForm')
          @form_submission =  @page.form_submissions.new
        elsif @page.type.eql?('View')
          @object_model=ObjectModel.find_by_id(@page.view_for)
        end
      end

      if @page.nil?
        redirect_to :action=>"error_page_display"
      end
   #if $USE_SHADOW
   #  render :layout=>false
   #end
  end

  def show_model_data
    @object= ObjectModel.find_by_perma_link_parent("/"+params[:permalinkparent])
    if @object.nil?
      redirect_to :action=>"error_page_display"
    else
      if validate_permission("view",@object)
        @model_submission=ModelSubmission.find_by_perma_link_and_object_model_id("/"+params[:permalink],@object.id)
        if @model_submission.nil?
	        redirect_to :action=>"error_page_display"
        else
	        @model_datas=ModelData.find_all_by_model_submission_id(@model_submission.id)
        end
      else
        redirect_to :action=>"no_permissions"
      end
    end
  end
  
  def error_page_display

  end

  def no_permissions
    
  end

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
              asset = Asset.new
              asset.sizes = component.default_value
              asset.upload = form_data[component.component_name]
              asset.save
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
end
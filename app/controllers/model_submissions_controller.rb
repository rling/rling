class ModelSubmissionsController < ApplicationController
  include ApplicationHelper
  include CacheHelper
  
  #FILTERS
  before_filter :get_object_model,:verify_permission

  # GET /object_model/1/model_submissions
  # GET /object_model/1/model_submissions.xml
  def index
 
   @model_submissions = []
   unless validate_permission("viewlist",@object)
      @model_submissions = @object.model_submissions.find(:all,:conditions=>["creator_id=?",current_user.id]) unless current_user.nil?
   else
      @model_submissions = @object.model_submissions.all
   end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @form_submissions }
    end
  end

  # GET /object_model/1/model_submissions/1
  # GET /object_model/1/model_submissions/1.xml
  def show
    @model_submission =  @object.model_submissions.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @model_submission }
    end
  end

  # GET /object_model/1/model_submissions/new
  # GET /object_model/1/model_submissions/new.xml
  def new
    @model_submission =  @object.model_submissions.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @model_submission }
    end
  end

  # GET /object_model/1/model_submissions/1/edit
  def edit
      @model_submission =  @object.model_submissions.find(params[:id])
     respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @model_submission }
    end
  end

  # POST /object_model/1/model_submissions
  # POST /object_model/1/model_submissions.xmlmodel_data
  def create
    message= "Your details have been submitted successfully"
    if @object.nil?
      message= "Could not submit your details. Please try again"
    else
      @model_submission =  @object.model_submissions.new(params[:model_submission])
      model_data=params[:form_field]
      mandatoryfailed = false
      @object.model_components.each do |component|
        if  component.component_name.eql?('title')
          @title =model_data[component.component_name]
        elsif  component.is_mandatory && model_data[component.component_name].blank?
          mandatoryfailed = true
          break;
        end
      end
      @model_submission.perma_link_generate(@title) if params[:permalnk] == "1"
      @model_submission.home_page = params[:home_page]
      @model_submission.status=params[:status]
      unless mandatoryfailed
        if @model_submission.save
          flash[:notice] = message
          @object.model_components.each do |component|
            case component.component_type
            when "File"
              unless model_data[component.component_name].nil?
                asset = Asset.create(:sizes=>component.default_value,:upload=>model_data[component.component_name])
                ModelData.create(:model_submission_id=>@model_submission.id,:model_component_id=>component.id,:data_value=>asset.id.to_s)
              end
            else
              ModelData.create(:model_submission_id=>@model_submission.id,:model_component_id=>component.id,:data_value=>model_data[component.component_name])
            end
          end
          message = "All details have been stored successfully"
          flash[:notice] = message
          respond_to do |format|
            format.html { redirect_to object_model_model_submissions_path(@model_submission) }
            format.xml  { render :xml => @model_submission, :status => :created, :location => @model_submission}
          end
        else 
          respond_to do |format|
            format.html { render :action => "new" }
            format.xml  { render :xml => @model_submission.errors, :status => :unprocessable_entity }
          end   
        end
      else
        message = "Ensure you have added all the mandatory fields"
        flash[:notice] = message
        respond_to do |format|
            format.html { render :action => "new" }
            format.xml  { render :xml => @model_submission.errors, :status => :unprocessable_entity }
        end 
      end
    end
  end

  # PUT /object_model/1/model_submissions/1
  # PUT /object_model/1/model_submissions/1.xml
  def update
    message= "Your details have been submitted successfully"
    if @object.nil?
      message= "Could not submit your details. Please try again"
    else
      @model_submission =  @object.model_submissions.find(params[:id])
      model_data=params[:form_field]
      mandatoryfailed = false
      @object.model_components.each do |component|
        if  component.component_name.eql?('title')
          @title =model_data[component.component_name]
        elsif  component.is_mandatory && model_data[component.component_name].blank?
          mandatoryfailed = true
          break;
        end
      end
      @model_submission.perma_link_generate(@title) if params[:permalnk] == "1"
      @model_submission.home_page = params[:home_page]
      @model_submission.status=params[:status] 
      unless mandatoryfailed
        if @model_submission.update_attributes(params[:model_submission])
          @object.model_components.each do |component|
            model_data_obj = ModelData.find_by_model_submission_id_and_model_component_id(@model_submission.id,component.id)
            model_data_obj = ModelData.new(:model_submission_id=>@model_submission.id,:model_component_id=>component.id) if model_data_obj.nil?
            case component.component_type
            when "File"
              unless model_data[component.component_name].nil?
                unless model_data_obj.data_value.blank?
                  asset = Asset.find(model_data_obj.data_value)
                  asset.destroy
	        end       
                asset = Asset.create(:sizes=>component.default_value,:upload=>model_data[component.component_name])
                model_data_obj.data_value = asset.id.to_s
              end
            else
              model_data_obj.data_value = model_data[component.component_name]
            end
            model_data_obj.save
          end
          flash[:notice] = "Submission Form Updated"
          respond_to do |format|
            format.html { redirect_to object_model_model_submissions_path(@model_submission) }
            format.xml  { head :ok }
          end
        else
          respond_to do |format|
            format.html { render :action=>'edit' }
            format.xml  { render :xml=>@model_submission.errors,:status=>:unprocessable_entity }
          end
        end
      else
        flash[:notice] = "Ensure all fields having Mandatory * are filled"
        respond_to do |format|
          format.html { render :action=>'edit' }
          format.xml  { render :xml=>@model_submission.errors,:status=>:unprocessable_entity }
        end
      end
    end
  end

  # DELETE /object_model/1/model_submissions/1
  # DELETE /object_model/1/model_submissions/1.xml
  def destroy
    @model_submission =  @object.model_submissions.find(params[:id])
    @model_submission.destroy

    respond_to do |format|
      format.html { redirect_to(object_model_model_submissions_path(@object)) }
      format.xml  { head :ok }
    end
  end

  # GET /object_model/1/model_submissions/1/delete_asset
  # GET /object_model/1/model_submissions/1/delete_asset.xml
   def delete_asset
    model_data = ModelData.find(params[:id])
     unless model_data.blank?
      asset = Asset.find(model_data.data_value)
      asset.destroy unless asset.nil?
     model_data.data_value = nil
     model_data.save
    end
    respond_to do |format|
      format.html { redirect_to(edit_object_model_model_submission_path(@object,model_data.model_submission)) }
      format.xml  { head :ok }
    end
   end

  # GET /object_model/1/model_submissions/1/add_category
  # GET /object_model/1/model_submissions/1/add_category.xml
  def add_category
     @model_submission =  @object.model_submissions.find(params[:id])
     @categories=@model_submission.categories
     respond_to do |format|
      format.html #add_category.html.erb
      format.xml  { render :xml=>@model_submission }
    end
   end

   def category_add
     
   end

private
  #Get the object model as required for model submissions to be associated to 
   def get_object_model
     @object=ObjectModel.find(params[:object_model_id])
   end


end



 

class FormSubmissionsController < ApplicationController
 before_filter :require_admin
 before_filter :get_object_form


  # GET /form_submissions
  # GET /form_submissions.xml
  def index
   @form_submissions = @page.form_submissions.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @form_submissions }
    end
  end

  # GET /form_submissions/1
  # GET /form_submissions/1.xml
  def show
    @form_submission = @page.form_submissions.find(params[:id])
    @form_submission.form_data
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @form_submission }
    end
  end



  # GET /form_submissions/1/edit
  def edit
    @form_submission = @page.form_submissions.find(params[:id])
  end



  # PUT /form_submissions/1
  # PUT /form_submissions/1.xml
  def update
      @form_submission = FormSubmission.find(params[:id])
      form_data = params[:form_field]
      mandatoryfailed = false
      @page.form_components.each do |component|
        if component.mandatory && form_data[component.component_name].blank?
          mandatoryfailed = true
          break;
        end
      end
      unless mandatoryfailed
        @page.form_components.each do |component|
          form_data_obj = FormData.find_by_form_submission_id_and_form_component_id(@form_submission.id,component.id)
          if form_data_obj.nil?
            form_data_obj = FormData.new(:form_submission_id=>@form_submission.id,:form_component_id=>component.id)
          end
          case component.component_type
          when "File"
            unless form_data[component.component_name].nil?
              unless form_data_obj.data_value.blank?
                asset = Asset.find(form_data_obj.data_value)
                asset.destroy
	      end
              asset = Asset.new
              asset.sizes = component.default_value
              asset.upload = form_data[component.component_name]
              asset.save
              form_data_obj.data_value = asset.id.to_s
            end
          else
            form_data_obj.data_value = form_data[component.component_name]
          end
          form_data_obj.save
        end
       flash[:notice] = "Submission Form Updated"
       redirect_to object_form_form_submissions_path(@path)
      else
       flash[:notice] = "Ensure all fields having Mandatory * are filled"
       render :action=>'edit'
      end
  end

  # DELETE /form_submissions/1
  # DELETE /form_submissions/1.xml
  def destroy
    @form_submission = @page.form_submissions.find(params[:id])
    @form_submission.destroy

    respond_to do |format|
      format.html { redirect_to(object_form_form_submissions_path(@page)) }
      format.xml  { head :ok }
    end
  end

  def delete_asset
     form_data = FormData.find(params[:id])
     unless form_data.blank?
      asset = Asset.find(form_data.data_value)
      asset.destroy unless asset.nil?
      form_data.data_value = nil
      form_data.save
    end
    respond_to do |format|
      format.html { redirect_to(edit_object_form_form_submission_path(@page,form_data.form_submission)) }
      format.xml  { head :ok }
    end
  end

  def get_object_form
   @page=ObjectForm.find(params[:object_form_id])
  end
end

class Admin::FormSubmissionsController < ApplicationController

 #FILTERS
 before_filter :require_admin
 before_filter :get_object_form

  # GET /object_form/1/form_submissions
  # GET /object_form/1/form_submissions.xml
  def index
   @form_submissions = @page.form_submissions.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @form_submissions }
    end
  end

  # GET /object_form/1/form_submissions/1
  # GET /object_form/1/form_submissions/1.xml
  def show
    @form_submission = @page.form_submissions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @form_submission }
    end
  end

  # GET /object_form/1/form_submissions/1/edit
  def edit
    @form_submission = @page.form_submissions.find(params[:id])
  end

  # PUT /object_form/1/form_submissions/1
  # PUT /object_form/1/form_submissions/1.xml
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
          form_data_obj = FormDatum.find_by_form_submission_id_and_form_component_id(@form_submission.id,component.id)
          form_data_obj = FormDatum.new(:form_submission_id=>@form_submission.id,:form_component_id=>component.id) if form_data_obj.nil?
          case component.component_type
          when "File"
            unless form_data[component.component_name].nil?
              unless form_data_obj.data_value.blank?
                asset = Asset.find(form_data_obj.data_value)
                asset.destroy
	      end
              asset = Asset.create(:sizes=>component.default_value,:upload=>form_data[component.component_name])
              form_data_obj.data_value = asset.id.to_s
            end
          else
            form_data_obj.data_value = form_data[component.component_name]
          end
          form_data_obj.save
        end
       flash[:notice] = t(:form_submission_updated)
       respond_to do |format|
        format.html {redirect_to object_form_form_submissions_path(@path)}
        format.xml  { render :xml => @form_submission }
       end
      else
       flash[:notice] = t(:mandatory_fields_required)
       respond_to do |format|
        format.html { render :action=>"edit" }
        format.xml { render :xml => @form_submission.errors, :status => :unprocessable_entity }
       end
      end
  end

  # DELETE /object_form/1/form_submissions/1
  # DELETE /object_form/1/form_submissions/1.xml
  def destroy
    @form_submission = @page.form_submissions.find(params[:id])
    @form_submission.destroy

    respond_to do |format|
      format.html { redirect_to(object_form_form_submissions_path(@page)) }
      format.xml  { head :ok }
    end
  end

  # DELETE /object_form/1/form_submissions/1/delete_asset
  # DELETE /object_form/1/form_submissions/1/delete_asset.xml
  def delete_asset
     form_data = FormDatum.find(params[:id])
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

private
 #GET the Object Form to which teh form submissions are made.
  def get_object_form
   @page=ObjectForm.find(params[:object_form_id])
  end
end

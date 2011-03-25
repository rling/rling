class SubmissionFormsController < ApplicationController
  before_filter :get_object_form


  # GET /submission_forms
  # GET /submission_forms.xml
    def index
   @submission_forms = @page.submission_forms.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @submission_forms }
    end
  end

  # GET /submission_forms/1
  # GET /submission_forms/1.xml
  def show
    @submission_form = @page.submission_forms.find(params[:id])
    @submission_form.form_data
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @submission_form }
    end
  end

  

  # GET /submission_forms/1/edit
  def edit
    @submission_form = @page.submission_forms.find(params[:id])
  end

  

  # PUT /submission_forms/1
  # PUT /submission_forms/1.xml
  def update
      @submission_form = SubmissionForm.find(params[:id])
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
          form_data_obj = FormData.find_by_submission_form_id_and_form_component_id(@submission_form.id,component.id)
          if form_data_obj.nil?
            form_data_obj = FormData.new(:submission_form_id=>@submission_form.id,:form_component_id=>component.id)
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
       redirect_to object_form_submission_forms_path(@path) 
      else
       flash[:notice] = "Ensure all fields having Mandatory * are filled"
       render :action=>'edit'
      end
  end

  # DELETE /submission_forms/1
  # DELETE /submission_forms/1.xml
  def destroy
    @submission_form = @page.submission_forms.find(params[:id])
    @submission_form.destroy

    respond_to do |format|
      format.html { redirect_to(object_form_submission_forms_path(@page)) }
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
      format.html { redirect_to(edit_object_form_submission_form_path(@page,form_data.submission_form)) }
      format.xml  { head :ok }
    end
  end 
 
  def get_object_form
   @page=ObjectForm.find(params[:object_form_id])
  end
 
end

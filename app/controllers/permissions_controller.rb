class PermissionsController < ApplicationController
  # GET /permissions
  # GET /permissions.xml
  def index
    @permissions = Permission.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @permissions }
    end
  end

  # GET /permissions/1
  # GET /permissions/1.xml
  def show
    @permission = Permission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @permission }
    end
  end

  # GET /permissions/new
  # GET /permissions/new.xml
  def new
    @permission_role = PermissionRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @permission_role }
    end
  end

  # GET /permissions/1/edit
  def edit
    @permission = Permission.find(params[:id])
  end

  # POST /permissions
  # POST /permissions.xml
  def create
    @permission_role = PermissionRole.new(params[:permission_role])

    respond_to do |format|
      if @permission_role.save
        format.html { redirect_to(@permission, :notice => 'Permission was successfully created.') }
        format.xml  { render :xml => @permission, :status => :created, :location => @permission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @permission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /permissions/1
  # PUT /permissions/1.xml
  def update
    @permission = Permission.find(params[:id])
    respond_to do |format|
      if @permission.update_attributes(params[:permission])
        format.html { redirect_to(@permission, :notice => 'Permission was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @permission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.xml
  def destroy
    @permission = Permission.find(params[:id])
    @permission.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def save_permission_roles
    @permission_role = PermissionRole.new#(params[:permission_role])
    @permission_role.permission_id=params[:permission_role]['permission.id']
    @permission_role.role_id=params[:permission_role]['role.id']
    #@permission_role.value=(params[:permission_role].nil? ? "false" : "true")
    @permission_role.save
      if @permission_role.save
      redirect_to admin_dashboard_path, :notice=>"Settings have been updated"
      else
       redirect_to permissions_path, :notice=>"Your settings are not saved. Please try again."
      end
    end
end

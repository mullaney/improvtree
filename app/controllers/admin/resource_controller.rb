class Admin::ResourceController < AdminController
  attr_reader :resource, :resources
  helper_method :resource, :resources, :resource_path, :resources_path,
                :new_resource_path, :edit_resource_path

  def show
    @resource = get_resource
  end

  def index
    @resources = get_resources
  end

  def new
    @resource = build_resource
  end

  def create
    @resource = build_resource
    @resource.attributes = resource_params
    if @resource.save
      redirect_to next_page_path || resource_path
    else
      render :new
    end
  end

  def edit
    @resource = get_resource
  end

  def update
    @resource = get_resource
    if @resource.update(resource_params)
      redirect_to resource_path
    else
      render :edit
    end
  end

  def resource_params
    params[resource_name]
  end

  def permitted_params
    []
  end

  def destroy
    @resource = get_resource
    @resource.destroy
    redirect_to next_page_path || resources_path
  end

  def build_resource
    resource_class.new
  end

  def get_resource
    resource_class.find(params[:id])
  end

  def get_resources
    resource_class.all
  end

  def resource_name(for_resource=nil)
    if for_resource
      for_resource.class.name.underscore
    else
      resource_class.name.underscore
    end
  end

  def next_page_path
    params[:next_page]
  end

  def resource_path(for_resource=@resource, options=nil)
    send :"admin_#{resource_name(for_resource)}_path", for_resource, options
  end

  def resources_path
    send :"admin_#{resource_name.pluralize}_path"
  end

  def edit_resource_path(for_resource=@resource)
    send :"edit_admin_#{resource_name(for_resource)}_path", for_resource
  end

  def new_resource_path
    send :"new_admin_#{resource_name}_path", @resource
  end
end

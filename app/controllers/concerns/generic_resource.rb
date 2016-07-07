module GenericResource
  extend ActiveSupport::Concern

  included do
    attr_reader :resource, :resources
    helper_method :resource, :resources, :resource_path, :resources_path,
                    :new_resource_path, :edit_resource_path
  end

  def show
    @resource = get_resource
    authorize_show!
  end

  def index
    @resources = get_resources
    authorize_index!
  end

  def new
    @resource = build_resource
    authorize_new!
  end

  def create
    @resource = build_resource
    @resource.attributes = resource_params
    authorize_create!
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
    authorize_update!
    if @resource.update(resource_params)
      redirect_to next_page_path || resource_path
    else
      render :edit
    end
  end

  def destroy
    @resource = get_resource
    authorize_destroy!
    @resource.destroy
    redirect_to next_page_path || resources_path
  end

  def authorize_read!
    raise User::NotAuthorized
  end

  def authorize_write!
    raise User::NotAuthorized
  end

  def authorize_show!
    authorize_read!
  end

  def authorize_index!
    authorize_read!
  end

  def authorize_new!
    authorize_write!
  end

  def authorize_create!
    authorize_write!
  end

  def authorize_edit!
    authorize_write!
  end

  def authorize_update!
    authorize_write!
  end

  def authorize_destroy!
    authorize_write!
  end

  def resource_params
    params[resource_name]
  end

  def permitted_params
    []
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

  def route_namespace; '' end

  def resource_path(for_resource=@resource, options=nil)
    send :"#{route_namespace}#{resource_name(for_resource)}_path", for_resource, options
  end

  def resources_path
    send :"#{route_namespace}#{resource_name.pluralize}_path"
  end

  def edit_resource_path(for_resource=@resource)
    send :"edit_#{route_namespace}#{resource_name(for_resource)}_path", for_resource
  end

  def new_resource_path
    send :"new_#{route_namespace}#{resource_name}_path", @resource
  end
end

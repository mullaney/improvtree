class Admin::ResourceController < AdminController
  include GenericResource

  def authorize_read!
    current_user.admin? or raise User::NotAuthorized
  end

  def authorize_write!
    current_user.admin? or raise User::NotAuthorized
  end

  def route_namespace; 'admin_' end
end

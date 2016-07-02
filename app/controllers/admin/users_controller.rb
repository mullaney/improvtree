class Admin::UsersController < Admin::ResourceController
  def resource_class; User end

  def show
    super
    @rep = Rep.new(from_node: resource.student)
  end
end

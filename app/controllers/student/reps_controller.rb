class Student::RepsController < Student::ResourceController
  def resource_class; Rep end

  def authorize_update!
    @resource.from_node === current_student or raise User::NotAuthorized
  end
end

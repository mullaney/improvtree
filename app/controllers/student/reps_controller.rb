class Student::RepsController < Student::ResourceController
  def resource_class; Rep end

  def authorize_update!
    @resource.enrollment.student === current_student or raise User::NotAuthorized
  end
end

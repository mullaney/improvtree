class Student::CommentsController < Student::ResourceController
  def resource_class; Comment end

  def authorize_create!
    if @resource.comment_on.class == Rep
      @resource.comment_on.enrollment.student == current_student or raise User::NotAuthorized
      @resource.author == current_student or raise User::NotAuthorized
    else
      raise User::NotAuthorized
    end
  end
end

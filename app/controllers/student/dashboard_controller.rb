class Student::DashboardController < StudentController
  def index
    @student = current_user.student
  end
end

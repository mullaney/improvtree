class StudentController < ApplicationController
  before_action :restrict_to_students


  helper_method :current_student
  def current_student
    @current_student ||= current_user.student
  end

  def restrict_to_students
    unless current_user && current_user.student?
      flash[:error] = "Not available."
      redirect_to root_path
    end
  end
end

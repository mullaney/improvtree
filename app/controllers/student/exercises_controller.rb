class Student::ExercisesController < Student::ResourceController
  def resource_class; Exercise end

  def get_resources
    current_user.student.exercises
  end
end

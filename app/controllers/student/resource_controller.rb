class Student::ResourceController < StudentController
  include GenericResource

  def authorize_index!
    true
  end

  def route_namespace; 'student_' end
end

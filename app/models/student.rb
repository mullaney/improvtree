class Student
  include ApplicationNode

  property :user_id
  has_many :out, :enrollments, type: :enrollment

  def exercises
    enrollments.reps.exercise
  end

  def user
    User.find(user_id)
  end
end

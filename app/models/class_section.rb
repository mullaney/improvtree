class ClassSection
  include ApplicationNode

  property :name, required: true, unique: true

  has_many :out, :enrollments,
    type: :enrollment

  def students
    enrollments.student
  end
end

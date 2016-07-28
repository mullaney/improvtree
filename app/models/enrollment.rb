class Enrollment
  include ApplicationNode

  has_many :out, :reps, type: :rep
  has_one :in, :student, type: :enrollment
  has_one :in, :class_section, type: :enrollment
end

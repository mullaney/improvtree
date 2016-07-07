class Rep
  include ApplicationRel

  from_class :Student
  to_class :Exercise
  type :rep

  property :difficulty, type: Integer

  validates_numericality_of :difficulty,
    integer_only: true,
    allow_nil: true
end

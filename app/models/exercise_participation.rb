class ExerciseParticipation
  include Neo4j::ActiveRel

  from_class :Person
  to_class :Exercise
  type :participated_in

  property :difficulty_rating
  property :run_rating

  validates :difficulty_rating, numericality: {
    allow_nil: true,
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than: 5,
  }

  validates :fun_rating, numericality: {
    allow_nil: true,
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than: 5,
  }
end

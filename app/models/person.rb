class Person
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :user_id, index: :exact, unique: true

  has_many :out, :exercises_taken, rel_class: :ExerciseParticipation
end

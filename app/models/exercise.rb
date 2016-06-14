class Exercise
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :title
  property :description
  property :code

  validates :title, presence: true, unique: true
  validates :code, presence: true, unique: true

  has_many :out, :prerequisite_of, rel_class: :ExercisePrerequisite
end

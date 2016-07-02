class Exercise
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :title
  property :description
  property :code

  validates :title, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  has_many :out, :prerequisite_of, rel_class: :ExercisePrerequisite
end

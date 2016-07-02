class Student
  include Neo4j::ActiveNode
  property :user_id
  has_many :out, :exercises, rel_class: :Rep
end

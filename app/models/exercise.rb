class Exercise
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :title
  property :description

end

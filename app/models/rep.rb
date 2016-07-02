class Rep
  include Neo4j::ActiveRel
  from_class :Student
  to_class :Exercise
  type :rep

  property :difficulty

end

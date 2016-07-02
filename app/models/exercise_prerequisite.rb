class ExercisePrerequisite
  include Neo4j::ActiveRel
  include Neo4j::Timestamps

  from_class :Exercise
  to_class :Exercise

  type 'prerequisite_of'
end

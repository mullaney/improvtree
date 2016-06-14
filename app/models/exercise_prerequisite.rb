class ExercisePrerequisite
  include Neo4j::ActiveRel

  from_class :Exercise
  to_class :Exercise

  type 'prerequisite_of'
end

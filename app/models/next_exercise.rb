class NextExercise
  include ApplicationRel

  from_class :Exercise
  to_class :Exercise
  type :next_exercise
end

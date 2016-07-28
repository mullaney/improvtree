class Exercise
  include ApplicationNode

  property :title
  property :description
  property :teachers_notes

  has_one :out, :next_exercise, rel_class: :NextExercise

  has_one :in, :previous_exercise, rel_class: :NextExercise
  has_many :in, :reps, type: :rep

  def self.series_roots
    Neo4j::Session.query.
      match('exercise').
      match('(exercise)-[:next_exercise]->()').
      where_not(' ()-[:next_exercise]->(exercise)').
      pluck('exercise')
  end

  def next_exercise_rel
    rels(type: :next_exercise).detect do |rel|
      rel.from_node === self
    end
  end

  def previous_exercise_rel
    rels(type: :next_exercise).detect do |rel|
      rel.to_node === self
    end
  end

  def next_exercises
    query_as(:exercise).
      match('(exercise)-[:next_exercise*]->(next)').
      return('next').
      pluck('next')
  end

  def previous_exercises
    query_as(:exercise).
      match('(previous)-[:next_exercise*]->(exercise)').
      return('previous').
      pluck('previous').reverse
  end
end

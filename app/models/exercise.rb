class Exercise
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :title
  property :description

  has_one :out, :next_exercise, rel_class: :NextExercise

  has_one :in, :previous_exercise, rel_class: :NextExercise

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

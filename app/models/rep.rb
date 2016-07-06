def get_node_by_uuid(uuid)
  Neo4j::Session.query.match('n').where('n.uuid' => uuid).return('n').first.try(:n)
end

class Rep
  include Neo4j::ActiveRel
  include Neo4j::Timestamps

  from_class :Student
  to_class :Exercise
  type :rep

  property :difficulty

  def from_node_uuid; end
  def to_node_uuid; end

  def from_node_uuid=(uuid)
    self.from_node = get_node_by_uuid(uuid)
  end

  def to_node_uuid=(uuid)
    self.to_node = get_node_by_uuid(uuid)
  end
end

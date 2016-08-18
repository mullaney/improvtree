def get_node_by_uuid(uuid)
    Neo4j::Session.query.match('n').where('n.uuid' => uuid).return('n').first.try(:n)
end

class Comment
  include ApplicationNode

  property :text

  has_one :out, :comment_on, type: :comment, model_class: false
  has_one :out, :author, type: :author, model_class: :Student

  def comment_on_uuid=(uuid)
    self.comment_on = get_node_by_uuid(uuid)
  end
end

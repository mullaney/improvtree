class Student
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :user_id
  has_many :out, :exercises, rel_class: :Rep

  def user
    User.find(user_id)
  end
end

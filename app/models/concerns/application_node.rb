module ApplicationNode
  extend ActiveSupport::Concern
  include Neo4j::ActiveNode
  include Neo4j::Timestamps
end

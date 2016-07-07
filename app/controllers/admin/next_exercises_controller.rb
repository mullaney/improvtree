class Admin::NextExercisesController < Admin::ResourceController
  def resource_class; NextExercise end

  def build_resource
   from_node = Exercise.find(resource_params['from_node_uuid'])
   to_node = Exercise.find(resource_params['from_node_uuid'])
   to_node.next_exercise_rel.try(:destroy)
   super
  end
end

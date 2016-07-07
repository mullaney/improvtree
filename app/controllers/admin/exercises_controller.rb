class Admin::ExercisesController < Admin::ResourceController
  def resource_class; Exercise end

  def permitted_params
    ['title', 'description']
  end
end

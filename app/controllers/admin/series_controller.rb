class Admin::SeriesController < Admin::ResourceController
  def resource_class; Exercise end

  def resources_path
    admin_series_index_path
  end

  def get_resources
    Exercise.series_roots
  end
end


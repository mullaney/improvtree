class Admin::RepsController < Admin::ResourceController
  def resource_class; Rep end

  def create
    params["rep"]["enrollments"].reject!(&:blank?)
    enrollment_ids = params["rep"]["enrollments"]

    authorize_create!

    enrollment_ids.each do |enrollment|
      resource = build_resource
      resource.enrollment = enrollment
      resource.exercise = params["rep"]["exercise"]
      resource.save
    end

    redirect_to next_page_path || resource_path
  end
end

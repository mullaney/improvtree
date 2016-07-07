module ApplicationHelper
  def admin_navigation_link(text, path)
    classname = 'admin-navigation-link'
    if respond_to?(:resources_path) && request.path.starts_with?(resources_path)
      classname << '-active'
    end

    link_to text, path, class: classname
  end

  def student_navigation_link(text, path)
    classname = 'student-navigation-link'
    if respond_to?(:resources_path) && request.path.starts_with?(resources_path)
      classname << '-active'
    end

    link_to text, path, class: classname
  end
end

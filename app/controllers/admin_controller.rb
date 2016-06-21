class AdminController < ApplicationController
  before_action :restrict_to_admins

  def restrict_to_admins
    unless current_user && current_user.admin?
      flash[:error] = "Not available."
      redirect_to root_path
    end
  end
end

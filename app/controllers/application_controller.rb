class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from User::NotAuthorized, with: :deny_access

  def deny_access
    flash[:error] = "You are not authorized to commit this action. Please log in."
    redirect_to root_path
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  # Returns the currently logged in user or nil if there isn't one
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # Make current_user available in templates as a helper
  helper_method :current_user

  # Filter method to enforce a login requirement
  # Apply as a before_filter on any controller you want to protect
  def authenticate
    logged_in? ? true : not_logged_in
  end

  def logged_in?
    current_user.is_a? User
  end

  # Make logged_in? available in templates as a helper
  helper_method :logged_in?

  def not_logged_in
    redirect_to login_path, :notice => 'Please log in to continue' and return false
  end

  helper_method :is_admin?

  def is_admin?
    if current_user and (current_user.admin == true)
      return true
    else
      access_denied
    end
  end

  def access_denied
    redirect_to root_path, :alert => 'Access denied' and return false
  end
end

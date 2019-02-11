class ApplicationController < ActionController::Base
  before_action :require_login
  skip_before_action :require_login, only: [:home, :login]

  private

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to '/' unless logged_in?
  end

  helper_method :current_user
end

class ApplicationController < ActionController::Base
  before_action :require_login
  skip_before_action :require_login, only: [:home, :login]
  before_action :is_current_user?
  skip_before_action :is_current_user?, only: [:home, :login, :logout]

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

  def is_current_user?
    if params[:controller] == "users"
      id = params[:id].to_i
    else
      id = params[:user_id].to_i
    end
    redirect_to '/' unless id == current_user.id
  end

  helper_method :current_user
end

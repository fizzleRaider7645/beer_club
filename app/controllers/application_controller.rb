class ApplicationController < ActionController::Base
  before_action :require_login
  skip_before_action :require_login, only: [:home, :login]
  before_action :is_current_user?
  skip_before_action :is_current_user?, only: [:index, :home, :login, :logout]

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
    return if !logged_in?
    return if user_account_delete(params)
    id = params[:user_id].to_i if params[:user_id]
    id ||= params[:id].to_i if user_show_page
    redirect_to '/' unless id == current_user.id
  end

  def user_account_delete(params)
    params[:controller] == "users" &&
    params[:action] == "destroy" &&
    params[:id].to_i == current_user.id
  end

  def user_show_page
    params["controller"] == "users" && params["action"] == "show"
  end

  helper_method :current_user
end

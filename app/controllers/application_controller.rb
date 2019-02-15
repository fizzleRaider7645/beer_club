class ApplicationController < ActionController::Base
  before_action :require_login
  skip_before_action :require_login, only: [:home, :login]
  before_action :is_current_user?
  skip_before_action :is_current_user?, only: [:index, :show, :home, :login, :logout]

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
    if !logged_in?
      return
    else
      redirect_to '/' unless params[:user_id].to_i == current_user.id
    end
  end

  helper_method :current_user
end

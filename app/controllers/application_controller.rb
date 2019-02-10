class ApplicationController < ActionController::Base

  def home

  end

  def login
    @user = User.find_by(username: params[:username])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def logout
    session.clear
    redirect_to :login
  end

  private

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to :login unless session.include? :user_id
  end

  helper_method :current_user
end

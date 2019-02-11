class ApplicationController < ActionController::Base
  before_action :require_login
  skip_before_action :require_login, only: [:home, :login]

  # def home
  # end
  #
  # def login
  #   @user = User.find_by(username: params[:username])
  #   if @user.present? && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to user_path(@user)
  #   else
  #     redirect_to '/'
  #   end
  # end
  #
  # def logout
  #   session.clear
  #   redirect_to '/'
  # end

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

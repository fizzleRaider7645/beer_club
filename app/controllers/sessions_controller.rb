class SessionsController < ApplicationController

  def home
    redirect_to user_path(current_user) if logged_in?
  end

  def login
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.find_by(username: params[:username])
      if @user.present? && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.new
        @user.errors[:login_error] << "Enter Valid Username & Password"
        render :home
      end
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end

end

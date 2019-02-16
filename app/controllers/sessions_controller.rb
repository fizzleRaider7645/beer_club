class SessionsController < ApplicationController

  def home
    redirect_to user_path(current_user) if logged_in?
  end

  def login
    if request.env["omniauth.auth"]
      oauth_username = request.env["omniauth.auth"][:info][:nickname]
      if @user = User.find_by(username: oauth_username)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.create(username: oauth_username, password: SecureRandom.hex)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
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

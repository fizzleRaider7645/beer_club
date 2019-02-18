class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    user = User.find_by(params[:id])
    destroy_reviews(user)
    user.destroy
    session.destroy
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def destroy_reviews(user)
      user.reviews.each do |review|
      review = Review.find_by(id: review.id)
      review.destroy
    end
  end
end

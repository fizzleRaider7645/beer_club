class ReviewsController < ApplicationController

  def index
    user_index if params.include?(:user_id)
    beer_index if params.include?(:beer_id)
    general_index if !params.include?(:user_id) && !params.include?(:beer_id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save
    if @review.errors.any?
      render :new
    else
      medal_check
      redirect_to user_path(current_user)
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    @review.update(review_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to user_path(current_user)
  end

  private

  def review_params
    params.require(:review).permit(:title, :date, :text, :rating, beer_attributes: [:id, :name,
      :country, :style, :brewery, :abv])
  end

  def user_index
    user = User.find_by(id: params[:user_id])
    @reviews = user.reviews
  end

  def beer_index
    beer = Beer.find_by(id: params[:beer_id])
    @reviews = beer.reviews
  end

  def general_index
    @reviews = Review.all
  end

  def medal_check
    user = @review.user
    user.medal_check
  end
end

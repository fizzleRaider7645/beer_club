class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to user_path(current_user)
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def edit
  end

  private

  def review_params
    params.require(:review).permit(:title, :date, :text, :rating, beer_attributes: [:name,
      :country, :style, :brewery, :abv])
  end
end

class ReviewsController < ApplicationController

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
  end

  def edit
  end

  private

  def review_params
    params.require(:review).permit(:title, :date, :text, :rating, beer_attributes: [:name,
      :style, :country, :ABV, :IBU])
  end
end

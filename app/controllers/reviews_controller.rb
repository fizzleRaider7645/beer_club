class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    raise params.inspect
    # redirect_to :show
  end

  def show
  end

  def edit
    # raise params.inspect
  end

  private

  def review_params
    params.require(:review).permit(:title, :date, :text, :beers, :user_id)
  end
end

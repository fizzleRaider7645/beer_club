class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @beer = Beer.find_by(name: params[:review][:beers][:name].titleize)
    if @beer.present?
      @review.beer = @beer
      @review.save
    else
      @review.build_beer(params.require(:review).require(:beers).permit(:name,
        :style, :country, :ABV, :IBU))
        @review.save
    end
    redirect_to user_path(current_user)
  end

  def show
  end

  def edit
    # raise params.inspect
  end

  private

  def review_params
    params.require(:review).permit(:title, :date, :text, :rating, :beers)
  end
end

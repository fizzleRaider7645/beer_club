class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # binding.pry
    # @review.user = current_user
    # @beer = Beer.find_by(name: params[:review][:beers][:name].titleize)
    # if @beer.present?
    #   @review.beer = @beer
    #   @review.save
    #   redirect_to user_path(current_user)
    # else
    #   @review.build_beer(params.require(:review).require(:beers).permit(:name,
    #     :style, :country, :ABV, :IBU))
    #   if @review.beer.name.blank?
    #     @review.errors[:name_error] << "Must Enter a Beer Name to Submit"
    #     render :new
    #   else
    #     @review.save
    #     redirect_to user_path(current_user)
    #   end
    # end
  end

  def show
  end

  def edit
    # raise params.inspect
  end

  private

  def review_params
    params.require(:review).permit(:title, :date, :text, :rating, beer_attributes: [:name,
      :style, :country, :ABV, :IBU])
  end
end

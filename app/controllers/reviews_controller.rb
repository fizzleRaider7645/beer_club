class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.find_by(id: params[:id])
    redirect_to :show
  end
end

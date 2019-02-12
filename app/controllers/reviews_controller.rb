class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.find_by(id: params[:id])
    redirect_to :show
  end

  def show
  end

  def edit
    # raise params.inspect
  end
end

class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    raise params.inspect
    # redirect_to :show
  end

  def show
  end

  def edit
    # raise params.inspect
  end
end

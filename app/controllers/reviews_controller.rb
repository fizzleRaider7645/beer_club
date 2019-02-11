class ReviewsController < ApplicationController

  def new
    @review = Session.new
  end

  def create
    @review = Session.find_by(id: params[:id])
    redirect_to :show
  end
end

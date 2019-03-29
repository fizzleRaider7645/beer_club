class ReviewsController < ApplicationController
  skip_before_action :is_current_user?, only: [:index, :show, :new, :create]

  def index
    user_index if params.include?(:user_id)
    beer_index if params.include?(:beer_id)
    general_index if !params.include?(:user_id) && !params.include?(:beer_id)
  end

  def new
    @beer = Beer.find_by(id:params[:beer_id])
    if @beer.present?
      @review = @beer.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save
    if @review.errors.any?
      render :new
    else
      medal_check
      # redirect_to user_path(current_user)
      render json: @review
    end
  end

  def show
    @review = Review.find_by(id: params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render :json => @review}
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    if @review.update(review_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
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
    respond_to do |format|
      format.html {render :index}
      format.json {render :json => @reviews}
    end
  end

  def beer_index
    beer = Beer.find_by(id: params[:beer_id])
    @reviews = beer.reviews
    respond_to do |format|
      format.html {render :index}
      format.json {render :json => @reviews}
    end
  end

  def general_index
    @reviews = Review.all
  end

  def medal_check
    user = @review.user
    user.medal_check
  end
end

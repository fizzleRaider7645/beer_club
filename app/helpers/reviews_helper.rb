module ReviewsHelper

  def review_errors
    @review.errors.full_messages
  end

  def review_beer
    if @review.beer
      @beer = @review.beer
    else
      @beer = Beer.new
    end
  end

  def no_reviews
    "No Reviews "if @reviews.empty?
  end

  def review_title
    if !params.include?(:user_id)
      "Community Reviews"
    else
      "Reviews"
    end
  end
end

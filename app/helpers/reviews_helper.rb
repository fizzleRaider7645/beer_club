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
end

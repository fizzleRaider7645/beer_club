module BeersHelper
  def no_beer_name_error
    if @review.beer && @review.beer.errors
      @review.beer.errors.full_messages.first.upcase
    end
  end
end

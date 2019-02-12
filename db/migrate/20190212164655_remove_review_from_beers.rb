class RemoveReviewFromBeers < ActiveRecord::Migration[5.2]
  def change
    remove_column :beers, :rating
  end
end

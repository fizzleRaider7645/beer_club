class RemoveBeerRatingFromSession < ActiveRecord::Migration[5.2]
  def change
    remove_column :sessions, :beer_rating
  end
end

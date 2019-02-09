class ChangeRatingColumnInBeers < ActiveRecord::Migration[5.2]
  def change
    change_column :beers, :rating, :float, inclusion: 0..5
  end
end

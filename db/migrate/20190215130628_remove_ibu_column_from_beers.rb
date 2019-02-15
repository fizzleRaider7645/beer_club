class RemoveIbuColumnFromBeers < ActiveRecord::Migration[5.2]
  def change
    remove_column :beers, :IBU
  end
end

class RemoveDescriptionFromBeers < ActiveRecord::Migration[5.2]
  def change
    remove_column :beers, :description
  end
end

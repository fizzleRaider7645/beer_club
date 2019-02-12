class ReAddDescriptionToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :description, :text
  end
end

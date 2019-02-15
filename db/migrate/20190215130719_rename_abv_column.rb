class RenameAbvColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :beers, :ABV, :abv
  end
end

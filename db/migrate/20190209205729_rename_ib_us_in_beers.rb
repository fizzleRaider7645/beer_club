class RenameIbUsInBeers < ActiveRecord::Migration[5.2]
  def change
    rename_column :beers, :IBUs, :IBU
  end
end

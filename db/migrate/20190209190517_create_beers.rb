class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :country
      t.float :IBUs
      t.float :ABV
      t.text :description
      t.integer :rating, inclusion: 0..5

      t.timestamps
    end
  end
end

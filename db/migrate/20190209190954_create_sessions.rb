class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.integer :beer_id
      t.float :beer_rating, inclusion: 0..5
      t.date :date
      t.timestamps
    end
  end
end

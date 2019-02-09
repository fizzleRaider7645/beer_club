class CreateMedals < ActiveRecord::Migration[5.2]
  def change
    create_table :medals do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :points

      t.timestamps
    end
  end
end

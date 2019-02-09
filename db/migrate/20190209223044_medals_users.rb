class MedalsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :medals_users do |t|
      t.integer :user_id
      t.integer :medal_id
    end
  end
end

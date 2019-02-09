class ChangeIbuDataTypeToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :beers, :IBU, :integer
  end
end

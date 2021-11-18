class AddIndexToFood < ActiveRecord::Migration[6.0]
  def change
    add_index :foods, :name, unique: true
  end
end

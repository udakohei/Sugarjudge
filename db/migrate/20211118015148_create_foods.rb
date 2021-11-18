class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :calorie, null: false
      t.integer :role, null: false
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end

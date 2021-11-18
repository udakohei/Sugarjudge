class CreateUsedFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :used_foods do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end

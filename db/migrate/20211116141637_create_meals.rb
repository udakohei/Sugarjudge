class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :meal_image, null: false
      t.integer :balance_of_payments
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

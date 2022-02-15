class AddIndexToUserFood < ActiveRecord::Migration[6.0]
  def change
    add_index :used_foods, %i[meal_id food_id], unique: true
  end
end

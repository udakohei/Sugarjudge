class AddColumnToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :apologize, :string
  end
end

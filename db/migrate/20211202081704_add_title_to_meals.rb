class AddTitleToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :title, :string
  end
end

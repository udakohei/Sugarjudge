class AddAnalyzedFoodsToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :analyzed_foods, :string 
  end
end

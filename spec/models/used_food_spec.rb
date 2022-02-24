require 'rails_helper'

RSpec.describe UsedFood, type: :model do
  it 'is valid with meal_id, food_id' do
    used_food = build(:used_food)
    expect(used_food).to be_valid
  end

  it 'is invalid with meal_id' do
    used_food_without_meal_id = build(:used_food, meal_id: nil)
    expect(used_food_without_meal_id).to be_invalid
  end

  it 'is invalid with food_id' do
    used_food_without_food_id = build(:used_food, food_id: nil)
    expect(used_food_without_food_id).to be_invalid
  end

  it 'is is valid with unique' do
    used_food = create(:used_food)
    used_food_with_unique = build(:used_food, meal: used_food.meal)
    expect(used_food_with_unique).to be_valid
  end

  it 'is is valid without unique' do
    used_food = create(:used_food)
    used_food_without_unique = build(:used_food, meal: used_food.meal, food: used_food.food)
    expect(used_food_without_unique).to be_invalid
  end
end

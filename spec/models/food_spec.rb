require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with name, sugar, role, genre_id' do
    food = build(:food)
    expect(food).to be_valid
  end

  it 'is invalid without name' do
    food_without_name = build(:food, name: '')
    expect(food_without_name).to be_invalid
    expect(food_without_name.errors[:name]).to include 'を入力してください'
  end

  it 'is invalid without sugar' do
    food_without_sugar = build(:food, sugar: nil)
    expect(food_without_sugar).to be_invalid
    expect(food_without_sugar.errors[:sugar]).to include 'を入力してください'
  end

  it 'is invalid without role' do
    food_without_role = build(:food, role: nil)
    expect(food_without_role).to be_invalid
    expect(food_without_role.errors[:role]).to include 'を入力してください'
  end

  it 'is invalid without genre_id' do
    food_without_genre_id = build(:food, genre_id: nil)
    expect(food_without_genre_id).to be_invalid
  end

  it 'is valid with unique name' do
    create(:food)
    food_with_unique_name = build(:food)
    expect(food_with_unique_name).to be_valid
  end

  it 'is invalid with duplicate name' do
    food = create(:food)
    food_with_duplicate_name = build(:food, name: food.name)
    expect(food_with_duplicate_name).to be_invalid
    expect(food_with_duplicate_name.errors[:name]).to include 'はすでに存在します'
  end
end

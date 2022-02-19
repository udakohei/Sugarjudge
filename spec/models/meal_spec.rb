require 'rails_helper'

RSpec.describe Meal, type: :model do
  it 'is valid with meal_image, user_id' do
    meal = build(:meal)
    expect(meal).to be_valid
  end

  it 'is invalid without meal_image' do
    meal_without_meal_image = build(:meal, meal_image: nil)
    expect(meal_without_meal_image).to be_invalid
    expect(meal_without_meal_image.errors[:meal_image]).to include 'を入力してください'
  end

  it 'is invalid without user_id' do
    meal_without_user_id = build(:meal, user_id: nil)
    expect(meal_without_user_id).to be_invalid
  end

  it 'is valid when apologize is shorter than 255' do
    meal_with_shorter_apologize = build(:meal, apologize: 'あ' * 254)
    expect(meal_with_shorter_apologize).to be_valid
  end

  it 'is valid when apologize is 255' do
    meal_with_255_apologize = build(:meal, apologize: 'あ' * 255)
    expect(meal_with_255_apologize).to be_valid
  end

  it 'is invalid when apologize is longer than 255' do
    meal_with_longer_apologize = build(:meal, apologize: 'あ' * 256)
    expect(meal_with_longer_apologize).to be_invalid
    expect(meal_with_longer_apologize.errors[:apologize]).to include 'は255文字以内で入力してください'
  end
end

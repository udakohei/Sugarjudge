class Meal < ApplicationRecord
  belongs_to :user
  has_many :used_foods, dependent: :destroy
  has_many :foods, through: :used_foods

  mount_uploader :meal_image, MealImageUploader

  validates :meal_image, presence: true

  def calorie_intake
    sum = 0
    foods.each do |food|
      sum += food.calorie
    end
    sum
  end

  def balance_of_payments
    calorie_intake - user.required_calorie.round
  end
end

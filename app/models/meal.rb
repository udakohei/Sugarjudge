class Meal < ApplicationRecord
  belongs_to :user

  mount_uploader :meal_image, MealImageUploader

  validates :meal_image, presence: true
end

class UsedFood < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  validates :food_id, uniqueness: { scope: :meal_id }
end

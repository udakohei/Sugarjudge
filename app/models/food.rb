class Food < ApplicationRecord
  belongs_to :genre
  has_many :used_foods, dependent: :destroy
  has_many :meals, through: :used_foods

  enum role: { concrete: 0, abstract: 1 }

  validates :name, presence: true, uniqueness: true
  validates :calorie, presence: true
  validates :role, presence: true
end

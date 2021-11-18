class Food < ApplicationRecord
  belongs_to :genre

  enum role: { concrete: 0, abstract: 1 }

  validates :name, presence: true, uniqueness: true
  validates :calorie, presence: true
  validates :role, presence: true
end

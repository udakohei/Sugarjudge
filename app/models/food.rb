class Food < ApplicationRecord
  belongs_to :genre
  has_many :used_foods, dependent: :destroy
  has_many :meals, through: :used_foods

  enum role: { concrete: 0, abstract: 1, others: 2 }

  validates :name, presence: true, uniqueness: true
  validates :sugar, presence: true
  validates :role, presence: true

  scope :search_foods, ->(analyzed_foods) { where('name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR 
    name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?', 
    
    "%#{analyzed_foods[0]}%", "%#{analyzed_foods[1]}%", "%#{analyzed_foods[2]}%", "%#{analyzed_foods[3]}%",
    "%#{analyzed_foods[4]}%", "%#{analyzed_foods[5]}%", "%#{analyzed_foods[6]}%", "%#{analyzed_foods[7]}%",
    "%#{analyzed_foods[8]}%", "%#{analyzed_foods[9]}%") }
end

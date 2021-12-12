class Genre < ApplicationRecord
  has_many :foods, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true

  scope :search_genres, ->(analyzed_foods) { where('name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR 
    name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?', 
    
    "%#{analyzed_foods[0]}%", "%#{analyzed_foods[1]}%", "%#{analyzed_foods[2]}%", "%#{analyzed_foods[3]}%",
    "%#{analyzed_foods[4]}%", "%#{analyzed_foods[5]}%", "%#{analyzed_foods[6]}%", "%#{analyzed_foods[7]}%",
    "%#{analyzed_foods[8]}%", "%#{analyzed_foods[9]}%") }

  def lowest_sugar_food
    foods.order(sugar: :asc).first
  end
end

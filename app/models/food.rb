class Food < ApplicationRecord
  belongs_to :genre
  has_many :used_foods, dependent: :destroy
  has_many :meals, through: :used_foods

  enum role: { concrete: 0, abstract: 1 }

  validates :name, presence: true, uniqueness: true
  validates :sugar, presence: true
  validates :role, presence: true

  scope :search_foods, lambda { |analyzed_foods|
                         where('name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR
    name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ? OR name LIKE ?',
                               "%#{analyzed_foods[0]}%", "%#{analyzed_foods[1]}%", "%#{analyzed_foods[2]}%", "%#{analyzed_foods[3]}%",
                               "%#{analyzed_foods[4]}%", "%#{analyzed_foods[5]}%", "%#{analyzed_foods[6]}%", "%#{analyzed_foods[7]}%",
                               "%#{analyzed_foods[8]}%", "%#{analyzed_foods[9]}%")
                       }

  def self.searched_foods(meal)
    foods_from_foods = concrete.search_foods(meal.pass_to_sql)
    foods_from_genres = Genre.search_genres(meal.pass_to_sql).map(&:foods)
    (foods_from_foods + foods_from_genres).flatten.uniq
  end
end
